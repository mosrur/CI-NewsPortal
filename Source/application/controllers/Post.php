<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Controller to handle the homepage of the portal
 * @author: Mohboob Chowdhury
 * @url: http://mosrur.com
 **/
class Post extends CI_Controller {

    /**
     * Constructor
     */
    public function __construct() {
        parent::__construct();

        if(!is_logged_in()) {
            redirect('account/login');
            return;
        }

        $this->load->model('post_model', 'posts');
    }

    /**
     * Display the list of posts
     */
    public function index() {
        $data['title'] = 'My posts | News Portal';
        $data['posts'] = $this->posts->get_by_iduser($this->user->id());

        $this->template->view('post/list', $data);
    }

    /**
     * Add new post
     */
    public function add() {
        $data['title'] = 'Add new post | News Portal';

        $this->load->model('category_model', 'cm');
        $data['categories'] = $this->cm->get_all();

        $this->load->library('form_validation');

        $this->form_validation->set_rules('title', 'title', 'trim|required');
        $this->form_validation->set_rules('body', 'post body', 'trim|required');

        if($this->input->method(TRUE) == 'POST' && $this->form_validation->run()) {

            $config['upload_path'] = './assets/uploads/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size']	= '2000';
            $config['max_width']  = '2000';
            $config['max_height']  = '1200';
            $config['encrypt_name']  = TRUE;

            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('image')) {
                $this->template->alert(
                    $this->upload->display_errors(),
                    'danger'
                );
            } else {
                $upload_data = $this->upload->data();
                $idpost = $this->posts->add(array(
                    'iduser' => $this->user->id(),
                    'title' => $this->input->post('title'),
                    'body' => $this->input->post('body'),
                    'image' => $upload_data['file_name']
                ));
                $tags = $this->input->post('tags');
                if(strlen($tags) > 0) {
                    $this->load->model('tag_model', 'tm');
                    $tags = explode(',', trim($tags));
                    $tags = array_map(array($this->tm, 'set_tag'), $tags);
                    $this->load->model('post_tag_model', 'ptm');
                    foreach($tags as $idtag) {
                        $this->ptm->add(array(
                            'idpost' => $idpost,
                            'idtag' => $idtag
                        ));
                    }
                }
                $idcategory = $this->input->post('category');
                if($idcategory) {
                    $this->load->model('post_category_model', 'pcm');
                    $this->pcm->add(array(
                        'idpost' => $idpost,
                        'idcategory' => $idcategory
                    ));
                }

                $this->template->alert(
                    'Added new news item successfully',
                    'success'
                );
                redirect('post');
                return;
            }
        }

        $this->template->view('post/add', $data);
    }

    /**
     * Delete one post
     * @param $idpost
     */
    public function delete($idpost) {
        $data['title'] = 'Delete post | News Portal';
        $data['post'] = $this->posts->get($idpost);

        if($this->input->method(TRUE) == 'POST' && $this->input->post('do_delete') == 1 && $this->input->post('idpost') == $idpost) {
            @unlink('./assets/uploads/' . $data['post']->image);
            $this->posts->delete($idpost);
            $this->template->alert(
                'Removed news post <strong>"' . $data['post']->title . '"</strong> permanently.',
                'warning'
            );
            redirect('post');
            return;
        }
        $this->template->view('post/delete', $data);
    }
}