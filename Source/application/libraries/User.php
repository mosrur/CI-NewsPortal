<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Library to handle users
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/

class User {
    
    var $ci;
    
    public function __construct() {
        $this->ci =& get_instance();
    }

    /**
     * Check if current user is logged in
     * @return bool
     * */
    public function loggedIn() {
        $logged_in = $this->ci->session->userdata('user_data');
        if($logged_in) {
            return TRUE;
        }        
        return FALSE;
    }
    
    /**
     * Login user and set session etc.
     * @param login_name: login name posted by user
     * @param password: password posted by user
     * @return bool
     * */
    public function login($login_name = null, $password = null) {
        if(!empty($login_name) && !empty($password)){
            $this->ci->load->model('user_model', 'um');
            if($user_data = $this->ci->um->login(array('email' => $login_name, 'password' => $password))){
                $this->ci->session->set_userdata(array('user_data' => $user_data));
                return TRUE;
            }
        }
        return FALSE;
    }

    /**
     * Log the user out
     * @return bool
     */
    public function logout() {
        if($this->loggedIn()){
            $this->ci->session->unset_userdata('user_data');
            return TRUE;
        }
        return FALSE;
    }

    /**
     * Get current user from session
     * @return mixed user object or bool
     */
    public function get() {
        if($this->loggedIn()) {
            $user_data = $this->ci->session->userdata('user_data');
            $this->ci->load->model('user_model', 'um');
            return $this->ci->um->get($user_data['iduser']);
        }
        return FALSE;
    }

    /**
     * Get current user id
     * @return mixed user id or bool
     */
    public function id() {
        if($this->loggedIn()) {
            $user_data = $this->ci->session->userdata('user_data');
            return $user_data['iduser'];
        }
        return FALSE;
    }

    /**
     * Get the user profile
     * @return mixed user profile array or bool
     */
    public function profile() {
        if($this->loggedIn()) {
            $user_data = $this->ci->session->userdata('user_data');
            $this->ci->load->model('user_model', 'um');
            return $this->ci->um->get_profile($user_data['iduser']);
        }
        return FALSE;
    }

    /**
     * Check if user is admin
     * @return bool
     */
    public function isAdmin() {
        if($this->loggedIn()){
            $this->ci =& get_instance();
            $this->ci->load->library('session');
            $user = $this->ci->session->userdata('user_data');
            return ($user['status'] == 9 ? TRUE : FALSE);
        }
        return FALSE;
    }

    /**
     * Create new user
     * @param $email string the email address of user
     * @return mixed user object or bool
     */
    public function create($email) {
        $this->ci->load->model('user_model', 'um');
        return $this->ci->um->add(
            array(
                'email'     => $email,
                'password'  => md5($email),
                'code'      => generate_validation_code($email),
                'status'    => 0
            )
        );
    }

    public function activate($key, $iduser, $password) {
        $this->ci->load->model('user_model', 'um');
        $current_user = $this->ci->um->get_by_key($key);
        if($current_user->iduser == $iduser) {
            return $this->ci->um->update(array('password' => $password, 'status' => 1, 'edit_date' => date('Y-m-d H:i:s'), 'edited_by' => 'web'), array('iduser' => $iduser));
        }
        return FALSE;
    }

    /**
     * Notify user via email
     * @param $iduser
     * @param string $notification
     * @return bool
     */
    public function notify($iduser, $notification = 'new_signup') {
        $this->ci->load->model('user_model', 'um');
        $current_user = $this->ci->um->get($iduser);

        if(!$current_user) {
            return FALSE;
        }

        switch($notification) {
            case 'welcome':
                $this->ci->load->library('email');

                $subject = 'Welcome to News Portal';
                $message = '<p>
                                Hello,<br />
                                Welcome to News Portal. We are really excited to see you on board. Hope you will enjoy your time here and enrich our portal with valuable contents.
                            </p>
                            <p>
                                Regards,<br />
                                News Portal Team
                            </p>';

                // Get full html:
                $body =
                    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset='.strtolower(config_item('charset')).'" />
                        <title>'.html_escape($subject).'</title>
                        <style type="text/css">
                            body {
                                font-family: Arial, Verdana, Helvetica, sans-serif;
                                font-size: 12px;
                            }
                        </style>
                    </head>
                    <body>
                    '.$message.'
                    </body>
                    </html>';

                $result = $this->ci->email
                    ->from('noreply@newsportal.com')
                    ->to($current_user->email)
                    ->subject($subject)
                    ->message($body)
                    ->send();

                if(!$result) {
                    $this->ci->template->alert(
                        strip_tags($this->ci->email->print_debugger()),
                        'warning'
                    );
                }

                return $result;

                break;
            case 'retrieve':

                $this->ci->load->library('email');

                $subject = 'Password reset request';
                $message = '<p>
                                Hello,<br />
                                We have received a password reset request for your account. Please follow <a href="'.base_url('account/reset/'.$current_user->code).'">this link</a> to set a new password. If you did not request the reset, please ignore this email. Although it is recommended to change your account password periodically.
                            </p>
                            <p>
                                You can copy and paste the URL below if the link does not work:<br />
                                '.base_url('account/reset/'.$current_user->code).'
                            </p>
                            <p>
                                Regards,<br />
                                News Portal Team
                            </p>';

                // Get full html:
                $body =
                    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset='.strtolower(config_item('charset')).'" />
                        <title>'.html_escape($subject).'</title>
                        <style type="text/css">
                            body {
                                font-family: Arial, Verdana, Helvetica, sans-serif;
                                font-size: 12px;
                            }
                        </style>
                    </head>
                    <body>
                    '.$message.'
                    </body>
                    </html>';

                $result = $this->ci->email
                    ->from('noreply@newsportal.com')
                    ->to($current_user->email)
                    ->subject($subject)
                    ->message($body)
                    ->send();

                if(!$result) {
                    $this->ci->template->alert(
                        strip_tags($this->ci->email->print_debugger()),
                        'warning'
                    );
                }

                return $result;

                break;
            case 'new_signup':
            default:

                $this->ci->load->library('email');

                $subject = 'Sign up confirmation';
                $message = '<p>
                                Hello,<br />
                                Thank you for joining the News Portal. Please follow <a href="'.base_url('account/activate/'.$current_user->code).'">this link</a> to activate your account.
                            </p>
                            <p>
                                You can copy and paste the URL below if the link does not work:<br />
                                '.base_url('account/activate/'.$current_user->code).'
                            </p>
                            <p>
                                Regards,<br />
                                News Portal Team
                            </p>';

                // Get full html:
                $body =
                    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset='.strtolower(config_item('charset')).'" />
                        <title>'.html_escape($subject).'</title>
                        <style type="text/css">
                            body {
                                font-family: Arial, Verdana, Helvetica, sans-serif;
                                font-size: 12px;
                            }
                        </style>
                    </head>
                    <body>
                    '.$message.'
                    </body>
                    </html>';

                $result = $this->ci->email
                    ->from('noreply@newsportal.com')
                    ->to($current_user->email)
                    ->subject($subject)
                    ->message($body)
                    ->send();

                if(!$result) {
                    $this->ci->template->alert(
                        strip_tags($this->ci->email->print_debugger()),
                        'warning'
                    );
                }

                return $result;

                break;
        }
    }
}