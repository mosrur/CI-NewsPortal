<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Model to handle categories
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/
class Category_model extends CI_Model {

    private $default_table = 'categories';

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

    public function get($idcategory) {
        $category = $this->db->get_where($this->default_table, array('idcategory' => $idcategory), 1);
        if(!$category) {
            return FALSE;
        }
        return $category->row();
    }

    public function get_all() {
        if($categories = $this->db->get($this->default_table)) {
            return $categories->result();
        }
        return FALSE;
    }

    public function get_by_category($title) {
        $category = $this->db->get_where($this->default_table, array('title' => $title), 1);
        if(!$category) {
            return FALSE;
        }
        return $category->row();
    }

    public function get_by_idpost($idpost) {
        $this->load->model('post_category_model', 'pcm');
        return $this->pcm->get_category_by_idpost($idpost);
    }

}