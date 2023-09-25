<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Space Dynamic - SEO HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('landing/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="{{ asset('landing/assets/css/fontawesome.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/templatemo-space-dynamic.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/animated.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/owl.css') }}">
    <!--
    
TemplateMo 562 Space Dynamic

https://templatemo.com/tm-562-space-dynamic

-->
</head>

<body>

    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo">
                            <h4>Spac<span>Dyna</span></h4>
                        </a>
<<<<<<< Updated upstream
                        <!-- LOGO -->
                        <div class="d-flex order-lg-2 ms-auto header-right-icons">
                            <button class="navbar-toggler navresponsive-toggler d-lg-none ms-auto" type="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent-4"
                                aria-controls="navbarSupportedContent-4" aria-expanded="false"
                                aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon fe fe-more-vertical"></span>
                            </button>
                            <div class="navbar navbar-collapse responsive-navbar p-0">
                                <div class="collapse navbar-collapse bg-white px-0" id="navbarSupportedContent-4">
                                    <!-- SEARCH -->
                                    <div class="header-nav-right p-5">
                                        {{-- <a href="register.html" class="btn ripple btn-min w-sm btn-outline-primary me-2 my-auto"
                                            target="_blank">New User
                                        </a> --}}
                                        <a href="login.html" class="btn ripple btn-min w-sm btn-primary me-2 my-auto">Login</a>
                                    </div>
                                </div>
=======
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="#about">About</a></li>
                            <li class="scroll-to-section"><a href="#services">Customer</a></li>
                            <li class="scroll-to-section"><a href="#portfolio">Gallery</a></li>
                            <li class="scroll-to-section"><a href="#contact">Contact Us</a></li>
                            {{-- <li class="scroll-to-section"><a href="#contact">Message Us</a></li> --}}
                            <li class="scroll-to-section">
                                <div class="main-red-button"><a href="#">Login</a></div>
                            </li>
                        </ul>
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

    <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6 align-self-center">
                            <div class="left-content header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                <h6>SELAMAT DATANG</h6>
                                <h5>Lebih Mudah Verifikasi Sertifikat TKDN Anda Dengan Aplikasi</h5>
                                <h2><em>TKDN</em> <span>BKI</span></h2>
                                <p>Mudah, Cepat, dan Tepat dalam melakukan verifikasi sertifikat anda.</p>
                            <button class="btn btn-lg btn-primary" style="border-radius: 20px">Tentang TKDN</button>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                <img src="{{ asset('landing/assets/images/banner-right-image.png') }}" alt="team meeting">
>>>>>>> Stashed changes
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<<<<<<< Updated upstream
            <div class="landing-top-header overflow-hidden">
                <div class="top sticky overflow-hidden">
                    <!--APP-SIDEBAR-->
                    <div class="app-sidebar__overlay" data-bs-toggle="sidebar"></div>
                    <div class="app-sidebar bg-transparent horizontal-main">
                        <div class="container">
                            <div class="row">
                                <div class="main-sidemenu navbar px-0">
                                    <a class="navbar-brand ps-0 d-none d-lg-block" href="index.html">
                                        <img alt="" class="logo-2" src="{{ asset('assets/images/bki-color-logo.png') }}" style="max-width: 80px;">
                                        <img src="{{ asset('assets/images/bki-color-logo.png') }}" class="logo-3" alt="logo" style="max-width: 80px;">
                                    </a>
                                    <ul class="side-menu">
                                        <li class="slide">
                                            <a href="{{route('dashboard')}}" class="side-menu__item"><span class="side-menu__label">Dashboard</span></a>
                                        </li>
                                        {{-- <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#Features"><span
                                                    class="side-menu__label">Features</span></a>
                                        </li>
                                        <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#About"><span
                                                    class="side-menu__label">About</span></a>
                                        </li>
                                        <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#Faqs"><span
                                                    class="side-menu__label">Faq's</span></a>
                                        </li>
                                        <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#Blog"><span
                                                    class="side-menu__label">Blog</span></a>
                                        </li>
                                        <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#Clients"><span
                                                    class="side-menu__label">Clients</span></a>
                                        </li>
                                        <li class="slide">
                                            <a class="side-menu__item" data-bs-toggle="slide" href="#Contact"><span
                                                    class="side-menu__label">Contact</span></a>
                                        </li> --}}
                                    </ul>
                                    <div class="header-nav-right d-none d-lg-flex">
                                        {{-- <a href="register.html"
                                            class="btn ripple btn-min w-sm btn-outline-primary me-2 my-auto d-lg-none d-xl-block d-block"
                                            target="_blank">New User
                                        </a> --}}
                                        <a href="/login" class="btn ripple btn-min w-sm btn-primary me-2 my-auto d-lg-none d-xl-block d-block">Login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
=======
    <div id="about" class="about-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-image wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <img src="{{ asset('landing/assets/images/about-left-image.png') }}" alt="person graphic">
>>>>>>> Stashed changes
                    </div>
                </div>
                <div class="col-lg-8 align-self-center">
                    <div class="services">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
                                    <div class="icon">
                                        <img src="{{ asset('landing/assets/images/service-icon-01.png') }}" alt="reporting">
                                    </div>
                                    <div class="right-text">
                                        <h4>Data Analysis</h4>
                                        <p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing eliter</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.7s">
                                    <div class="icon">
                                        <img src="{{ asset('landing/assets/images/service-icon-02.png') }}" alt="">
                                    </div>
                                    <div class="right-text">
                                        <h4>Data Reporting</h4>
                                        <p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing eliter</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.9s">
                                    <div class="icon">
                                        <img src="{{ asset('landing/assets/images/service-icon-03.png') }}" alt="">
                                    </div>
                                    <div class="right-text">
                                        <h4>Web Analytics</h4>
                                        <p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing eliter</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="1.1s">
                                    <div class="icon">
                                        <img src="{{ asset('landing/assets/images/service-icon-04.png') }}" alt="">
                                    </div>
                                    <div class="right-text">
                                        <h4>SEO Suggestions</h4>
                                        <p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing eliter</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="services" class="our-services section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center  wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.2s">
                    <div class="left-image">
                        <img src="{{ asset('landing/assets/images/services-left-image.png') }}" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.2s">
                    <div class="section-heading">
                        <h2>Grow your website with our <em>SEO</em> service &amp; <span>Project</span> Ideas</h2>
                        <p>Space Dynamic HTML5 template is free to use for your website projects. However, you are not permitted to redistribute the template ZIP file on any CSS template collection websites. Please contact us for more information. Thank you for your kind cooperation.</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="first-bar progress-skill-bar">
                                <h4>Website Analysis</h4>
                                <span>84%</span>
                                <div class="filled-bar"></div>
                                <div class="full-bar"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="second-bar progress-skill-bar">
                                <h4>SEO Reports</h4>
                                <span>88%</span>
                                <div class="filled-bar"></div>
                                <div class="full-bar"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="third-bar progress-skill-bar">
                                <h4>Page Optimizations</h4>
                                <span>94%</span>
                                <div class="filled-bar"></div>
                                <div class="full-bar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="portfolio" class="our-portfolio section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading  wow bounceIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <h2>See What Our Agency <em>Offers</em> &amp; What We <span>Provide</span></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <a href="#">
                        <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.3s">
                            <div class="hidden-content">
                                <h4>SEO Analysis</h4>
                                <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
                            </div>
                            <div class="showed-content">
                                <img src="{{ asset('landing/assets/images/portfolio-image.png') }}" alt="">
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <a href="#">
                        <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.4s">
                            <div class="hidden-content">
                                <h4>Website Reporting</h4>
                                <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
                            </div>
                            <div class="showed-content">
                                <img src="{{ asset('landing/assets/images/portfolio-image.png') }}" alt="">
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <a href="#">
                        <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.5s">
                            <div class="hidden-content">
                                <h4>Performance Tests</h4>
                                <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
                            </div>
                            <div class="showed-content">
                                <img src="{{ asset('landing/assets/images/portfolio-image.png') }}" alt="">
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <a href="#">
                        <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.6s">
                            <div class="hidden-content">
                                <h4>Data Analysis</h4>
                                <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
                            </div>
                            <div class="showed-content">
                                <img src="{{ asset('landing/assets/images/portfolio-image.png') }}" alt="">
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div id="blog" class="our-blog section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.25s">
                    <div class="section-heading">
                        <h2>Check Out What Is <em>Trending</em> In Our Latest <span>News</span></h2>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.25s">
                    <div class="top-dec">
                        <img src="{{ asset('landing/assets/images/blog-dec.png') }}" alt="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.25s">
                    <div class="left-image">
                        <a href="#"><img src="{{ asset('landing/assets/images/big-blog-thumb.jpg') }}" alt="Workspace Desktop"></a>
                        <div class="info">
                            <div class="inner-content">
                                <ul>
                                    <li><i class="fa fa-calendar"></i> 24 Mar 2021</li>
                                    <li><i class="fa fa-users"></i> TemplateMo</li>
                                    <li><i class="fa fa-folder"></i> Branding</li>
                                </ul>
                                <a href="#">
                                    <h4>SEO Agency &amp; Digital Marketing</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur and sed doer ket eismod tempor incididunt ut labore et dolore magna...</p>
                                <div class="main-blue-button">
                                    <a href="#">Discover More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.25s">
                    <div class="right-list">
                        <ul>
                            <li>
                                <div class="left-content align-self-center">
                                    <span><i class="fa fa-calendar"></i> 18 Mar 2021</span>
                                    <a href="#">
                                        <h4>New Websites &amp; Backlinks</h4>
                                    </a>
                                    <p>Lorem ipsum dolor sit amsecteturii and sed doer ket eismod...</p>
                                </div>
                                <div class="right-image">
                                    <a href="#"><img src="{{ asset('landing/assets/images/blog-thumb-01.jpg') }}" alt=""></a>
                                </div>
                            </li>
                            <li>
                                <div class="left-content align-self-center">
                                    <span><i class="fa fa-calendar"></i> 14 Mar 2021</span>
                                    <a href="#">
                                        <h4>SEO Analysis &amp; Content Ideas</h4>
                                    </a>
                                    <p>Lorem ipsum dolor sit amsecteturii and sed doer ket eismod...</p>
                                </div>
                                <div class="right-image">
                                    <a href="#"><img src="{{ asset('landing/assets/images/blog-thumb-01.jpg') }}" alt=""></a>
                                </div>
                            </li>
                            <li>
                                <div class="left-content align-self-center">
                                    <span><i class="fa fa-calendar"></i> 06 Mar 2021</span>
                                    <a href="#">
                                        <h4>SEO Tips &amp; Digital Marketing</h4>
                                    </a>
                                    <p>Lorem ipsum dolor sit amsecteturii and sed doer ket eismod...</p>
                                </div>
                                <div class="right-image">
                                    <a href="#"><img src="{{ asset('landing/assets/images/blog-thumb-01.jpg') }}" alt=""></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="contact" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center wow fadeInLeft" data-wow-duration="0.5s" data-wow-delay="0.25s">
                    <div class="section-heading">
                        <h2>Feel Free To Send Us a Message About Your Website Needs</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doer ket eismod tempor incididunt ut labore et dolores</p>
                        <div class="phone-info">
                            <h4>For any enquiry, Call Us: <span><i class="fa fa-phone"></i> <a href="#">010-020-0340</a></span></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInRight" data-wow-duration="0.5s" data-wow-delay="0.25s">
                    <form id="contact" action="" method="post">
                        <div class="row">
                            <div class="col-lg-6">
                                <fieldset>
                                    <input type="name" name="name" id="name" placeholder="Name" autocomplete="on" required>
                                </fieldset>
                            </div>
                            <div class="col-lg-6">
                                <fieldset>
                                    <input type="surname" name="surname" id="surname" placeholder="Surname" autocomplete="on" required>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email" required="">
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <textarea name="message" type="text" class="form-control" id="message" placeholder="Message" required=""></textarea>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <button type="submit" id="form-submit" class="main-button ">Send Message</button>
                                </fieldset>
                            </div>
                        </div>
                        <div class="contact-dec">
                            <img src="{{ asset('landing/assets/images/contact-decoration.png') }}" alt="">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.25s">
                    <p>© Copyright 2021 Space Dynamic Co. All Rights Reserved.

                        <br>Design: <a rel="nofollow" href="https://templatemo.com">TemplateMo</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('landing/assets/js/owl-carousel.js"></script>
    <script src="{{ asset('landing/assets/js/animation.js"></script>
    <script src="{{ asset('landing/assets/js/imagesloaded.js"></script>
    <script src="{{ asset('landing/assets/js/templatemo-custom.js"></script>

</body>

</html>
