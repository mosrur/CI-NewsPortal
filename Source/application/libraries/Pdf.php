<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * CodeIgniter PDF Library to generate PDF using TCPDF
 *
 * @author Mohboob Chowdhury
 * @author_url http://mosrur.com
 **/

require_once(dirname(__FILE__) . '/../third_party/tcpdf/tcpdf.php');

class Pdf extends TCPDF
{
	var $ci;
	public function __construct() {
		parent::__construct();
		$this->ci =& get_instance();
	}

	/**
	 * Load a CodeIgniter view into domPDF
	 *
	 * @access	public
	 * @param	string	$view The view to load
	 * @param	array	$data The view data
	 * @return	void
	 */
	public function generate($view, $data = array())
	{
		$this->ci->load->helper('security');
		$html = $this->ci->load->view($view, $data, TRUE);
		$this->addPage();

		$this->writeHTML($html, true, false, true, false, '');
	}
}