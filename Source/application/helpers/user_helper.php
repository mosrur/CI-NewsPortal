<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * File to hold user related helper functions
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/

if(!function_exists('is_logged_in')) {

    /**
     * Check if current user is logged in
     * @return bool
     */
    function is_logged_in() {
        $CI =& get_instance();
        return $CI->user->loggedIn();
    }
}

if(!function_exists('generate_validation_code')) {
    function generate_validation_code($email) {
        return strrev(md5(strrev($email) . time() . rand()));
    }
}

if(!function_exists('get_gravatar')) {
    /**
     * Get either a Gravatar URL or complete image tag for a specified email address.
     *
     * @param string $email The email address
     * @param int $s Size in pixels, defaults to 80px [ 1 - 2048 ]
     * @param string $d Default imageset to use [ 404 | mm | identicon | monsterid | wavatar ]
     * @param string $r Maximum rating (inclusive) [ g | pg | r | x ]
     * @param bool $img True to return a complete IMG tag False for just the URL
     * @param array $atts Optional, additional key/value attributes to include in the IMG tag
     * @return String containing either just a URL or a complete image tag
     * @source http://gravatar.com/site/implement/images/php/
     */
    function get_gravatar($email, $s = 80, $d = 'mm', $r = 'g', $img = false, $atts = array())
    {
        $url = 'http://www.gravatar.com/avatar/';
        $url .= md5(strtolower(trim($email)));
        $url .= "?s=$s&d=$d&r=$r";
        if ($img) {
            $url = '<img src="' . $url . '"';
            foreach ($atts as $key => $val)
                $url .= ' ' . $key . '="' . $val . '"';
            $url .= ' />';
        }
        return $url;
    }
}

if(!function_exists('get_user_profile')) {
    /**
     * Get user profile based on user id
     * @param $iduser
     * @return mixed profile object or bool
     */
    function get_user_profile($iduser) {
        $CI =& get_instance();
        $CI->load->model('profile_model', 'profile');
        return $CI->profile->get_by_iduser($iduser);
    }
}