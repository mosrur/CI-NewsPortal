<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Model to handle user related actions
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/
class Profile_model extends CI_Model {

    private $default_table = 'profiles';

    public function add($data) {
        if($this->db->insert($this->default_table, $data)){
            return $this->db->insert_id();
        }

        return FALSE;
    }

    public function update($data, $where) {
        if($this->db->update($this->default_table, $data, $where)) {
            return $this->db->affected_rows();
        }
        return FALSE;
    }

    public function get($idprofile) {
        $profile = $this->db->get_where($this->default_table, array('idprofile' => $idprofile), 1);
        if(!$profile) {
            return FALSE;
        }
        return $profile->row();
    }

    public function get_by_iduser($iduser) {
        $profile = $this->db->get_where($this->default_table, array('iduser' => $iduser), 1);
        if(!$profile) {
            return FALSE;
        }
        return $profile->row();
    }

    public function get_user($idprofile) {
        $profile = $this->get($idprofile);
        if(!$profile) {
            return FALSE;
        }
        $this->load->model('user_model', 'um');
        return $this->pm->get_by_iduser($profile->iduser);
    }

}