<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Define the default template
 **/
define('DEFAULT_TEMPLATE', 'default');

class Template {

    /**
     * The CodeIgniter instance for the library
     **/
    var $ci;
    
    /**
     * The constructor of the library
     * Sets the CodeIgniter instance
     *
     * @access public
     **/
    public function __construct() 
    {
        $this->ci =& get_instance();
    }
    
    /**
     * This function gets the active template.
     *
     * @param string $default The default template to load incase nothing is found
     * @return string the current template name
     * @access public
     **/
	public function get($default = DEFAULT_TEMPLATE)
	{
        $template = $this->ci->session->userdata('active_template');
        if($template && $template !== NULL) {
            return $template;
        }
		return $default;
	}
    
    /**
     * This function sets the template for active session.
     *
     * @param string $default The default template to load incase nothing is found
     * @return bool status whether the template is set
     * @access public
     **/
	public function set($default = DEFAULT_TEMPLATE)
	{
        $this->ci->session->set_userdata('active_template', $default);
		return $default;
	}

    /**
     * This function generates the output based on active template.
     *
     * @param string $view The desired view file for content without the .php extension
     * @param array $data The data to be displayed in the view
     * @param bool $alternate_template Whether an alternative template to be used for this view
     * @param string $template Name of the alternative template to be used
     * @param bool $no_skeleton set whether to load the skeleton layout
     *
     * @internal param bool $print Whether this is a print view
     * @access public
     */
	public function view($view = '', $data = NULL, $alternate_template = FALSE, $template = DEFAULT_TEMPLATE, $no_skeleton = FALSE)
	{
        $template_name = $template;
        if(!$alternate_template) {
            $template_name = $this->get();
        }

        $data['template_name'] = $template_name;
        $alerts = $this->ci->session->userdata('alert');
        if(!empty($alerts)) {
            $data['alerts'] = $this->ci->session->userdata('alert');
            $this->ci->session->set_userdata('alert', array());
        }
        
        if(strlen($view) == 0 || !file_exists( APPPATH . 'views/' . $template_name . '/' . $view . '.php')) {
            show_error('Unable to load the template: ' . $template_name . '/' . $view . '.php');
        }

        if(!$no_skeleton) {
            $this->ci->load->view($template_name . '/' . 'layout', array('data' => $data, 'view' => $template_name . '/' . $view));
            return;
        }
        $this->ci->load->view($template_name . '/' . $view, array('data' => $data));
	}

    public function alert($message, $type = 'info') {
        $alerts = $this->ci->session->userdata('alert');
        $alerts[$type][] = $message;
        $this->ci->session->set_userdata('alert', $alerts);
    }
    
}

/* End of file Template.php */
/* Location: ./application/libraries/Template.php */