<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * File to hold functions to handle actions on news post
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/

if(!function_exists('get_category')) {

    /**
     * Get category by post id
     * @param string $idpost
     * @return mixed
     */
    function get_category($idpost) {
        $CI =& get_instance();
        $CI->load->model('category_model', 'categories');
        return $CI->categories->get_by_idpost($idpost);
    }
}

if(!function_exists('get_categories')) {
    /**
     * Get all the categories
     * @return mixed
     */
    function get_categories() {
        $CI =& get_instance();
        $CI->load->model('category_model', 'categories');
        return $CI->categories->get_all();
    }
}

if(!function_exists('get_tags')) {
    /**
     * Get tags by post id
     * @param string $idpost
     * @return mixed
     */
    function get_tags($idpost) {
        $CI =& get_instance();
        $CI->load->model('tag_model', 'tags');
        return $CI->tags->get_by_idpost($idpost);
    }
}

if(!function_exists('get_posts')) {
    /**
     * Get the list of post
     * @param int $count
     * @return mixed list of post or bool
     */
    function get_posts($count = 5) {
        $CI =& get_instance();
        $CI->load->model('post_model', 'posts');
        return $CI->posts->get_posts($count);
    }
}