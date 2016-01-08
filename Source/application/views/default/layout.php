<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo (isset($data['title']) ? $data['title'] : "News Portal") ?></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Josefin+Slab:400,700|Dancing+Script|Open+Sans:400,300italic,300,400italic' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="<?php echo assets_url('css/style.css'); ?>" type="text/css" />

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="wrapper">
    <header class="container header-wrapper">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <?php if(!isset($data['pdf']) || $data['pdf'] == FALSE): ?>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#new-portal-navbar" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <?php endif; ?>
                            <a href="<?php echo base_url(); ?>" class="navbar-brand cursive logo">News portal</a>
                        </div>
                        <?php if(!isset($data['pdf']) || $data['pdf'] == FALSE): ?>
                        <div class="collapse navbar-collapse" id="new-portal-navbar">
                            <ul class="nav navbar-nav">
                                <li <?php if(uri_string() == ''): ?> class="active" <?php endif; ?>>
                                    <a href="<?php echo base_url(); ?>">
                                        <i class="fa fa-fw fa-home"></i> Home
                                    </a>
                                </li>
                                <li class="dropdown <?php if(strstr(uri_string(), 'category/') !== FALSE): ?> active <?php endif; ?>">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-fw fa-filter"></i> Categories <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <?php
                                        $categories = get_categories();
                                        if($categories):
                                            foreach($categories as $category):
                                        ?>
                                                <li>
                                                    <a href="<?php echo base_url('news/category/' . $category->idcategory); ?>">
                                                        <?php echo $category->title; ?>
                                                    </a>
                                                </li>
                                        <?php
                                            endforeach;
                                        endif;
                                        ?>
                                    </ul>
                                </li>

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-fw fa-user"></i> Account <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <?php if(!is_logged_in()): ?>
                                            <li><a href="<?php echo base_url('account/login'); ?>">Log in</a></li>
                                            <li><a href="<?php echo base_url('account/signup'); ?>">Sign up</a></li>
                                        <?php else: ?>
                                            <li><a href="<?php echo base_url('account'); ?>">Manage account</a></li>
                                            <li><a href="<?php echo base_url('post'); ?>">My posts</a></li>
                                            <li><a href="<?php echo base_url('account/logout'); ?>">Log out</a></li>
                                        <?php endif; ?>
                                    </ul>
                                </li>
                            </ul>
                            <form class="navbar-form navbar-right" role="search" method="post" action="<?php echo base_url('news/search'); ?>">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search" name="keyword" />
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form>
                        </div>
                        <?php endif; ?>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
        <?php if(isset($data['sidebar']) && $data['sidebar'] == FALSE): ?>
            <div class="col-md-12">
                <?php $this->load->view($data['template_name'] . '/partials/alerts', $data); ?>
                <?php $this->load->view($view, $data); ?>
            </div>
        <?php else: ?>
            <div class="col-md-9 main-content">
                <?php $this->load->view($data['template_name'] . '/partials/alerts', $data); ?>
                <?php $this->load->view($view, $data); ?>
            </div>
            <div class="col-md-3">
                <div class="sidebar clearfix">
                    <?php $this->load->view($data['template_name'] . '/partials/sidebar', $data); ?>
                </div>
            </div>
        <?php endif; ?>
        </div>
    </div>
    <div class="container-fluid">
        <hr />
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-left">
                    <p>
                        <i class="fa fa-rss-square"></i> <a href="<?php echo base_url('news/rss'); ?>">Subscribe to the rss feed</a>.
                    </p>
                </div>
                <div class="col-md-6 text-right">
                    <p>
                        &copy; <?php echo date('Y'); ?> The Great News Agency. All rights reserved.<br />
                        Application developed by <a href="http://mosrur.com/" target="_blank">Mohboob Chowdhury</a>.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

