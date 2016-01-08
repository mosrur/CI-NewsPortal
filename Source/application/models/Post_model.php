<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Model to handle news posts
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/
class Post_model extends CI_Model {

    private $default_table = 'posts';

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

    public function delete($idpost) {
        return $this->db->delete($this->default_table, array('idpost' => $idpost));
    }

    public function get($idpost) {
        $post = $this->db->get_where($this->default_table, array('idpost' => $idpost), 1);
        if(!$post) {
            return FALSE;
        }
        return $post->row();
    }

    public function get_posts($count = 5) {
        $this->db->order_by('add_date', 'desc');
        $posts = $this->db->get($this->default_table, $count);
        if(!$posts) {
            return FALSE;
        }
        return $posts->result();
    }

    public function get_all() {
        $this->db->order_by('add_date', 'desc');
        $posts = $this->db->get($this->default_table);
        if(!$posts) {
            return FALSE;
        }
        return $posts->result();
    }

    public function get_by_keyword($keyword) {
        $this->db->like('title', $keyword);
        $this->db->or_like('body', $keyword);
        $this->db->order_by('add_date', 'desc');
        $posts = $this->db->get($this->default_table);
        if(!$posts) {
            return FALSE;
        }
        return $posts->result();
    }

    public function get_by_iduser($iduser) {
        $this->db->order_by('add_date', 'desc');
        $posts = $this->db->get_where($this->default_table, array('iduser' => $iduser));
        if(!$posts) {
            return FALSE;
        }
        return $posts->result();
    }

    public function get_by_idtag($idtag) {
        $this->load->model('post_tag_model', 'ptm');
        return $this->ptm->get_posts_by_idtag($idtag);
    }

    public function get_by_idcategory($idcategory) {
        $this->load->model('post_category_model', 'pcm');
        return $this->pcm->get_posts_by_idcategory($idcategory);
    }

}