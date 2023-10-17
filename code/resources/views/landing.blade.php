<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>TKDN BKI</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('landing/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="{{ asset('landing/assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/templatemo-space-dynamic.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/animated.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/owl.css') }}">
    <link rel="stylesheet" href="{{ asset('landing/assets/css/index.css') }}">
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
                        <a href="/" class="logo">
                            <img src="{{ asset('landing/assets/images/tkdn-bki.png') }}" style="max-height: 50px" alt="">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="#about">About</a></li>
                            {{-- <li class="scroll-to-section"><a href="#services">Customer</a></li> --}}
                            <li class="scroll-to-section"><a href="#portfolio">Progress</a></li>
                            <li class="scroll-to-section"><a href="#contact">Contact Us</a></li>
                            {{-- <li class="scroll-to-section"><a href="#contact">Message Us</a></li> --}}
                            <li class="scroll-to-section">
                                <div class="main-blue-button"><a href="{{ route('login') }}">Login</a></div>
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
                                <h2><em>TK</em><span>D</span>N <em>BKI</em></h2>
                                <h2><em>DIGITALISASI PROSES</em></h2>
                                <h2><em>SERTIFIKASI</em><em> TK</em><span>D</span>N</h2>
                                <h5 style="padding: 20px 0px 30px 0px;">Proses Sertifikasi TKDN <br> <br>Menjadi Lebih <strong>CEPAT</strong>, <strong>AKUNTABEL</strong>, dan <strong>TRANSPARAN</strong></h5>
                                <div class="main-blue-button"><a href="#about" style="border-radius: 20px;">TENTANG KAMI</a></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                <img src="{{ asset('landing/assets/images/file-transfer.svg') }}" alt="team meeting">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="introduction">
        <div class="why-us">
            <div class="row">
                <div class="col-xl-8 col-md-12 col-sm-12" style="padding: 30px">
                    <h2>TKDN BKI CEPAT, AKUNTABEL & TRANSPARAN</h2>
                    <h5>Kenapa harus BKI?</h5>
                    <p>
                        PT Biro Klasifikasi Indonesia (Persero) merupakan Induk Holding Perusahaan Jasa Survey BUMN di Indonesia yang berdiri sejak 01 Juli 1964. Dengan semangat “Pertumbuhan berkelanjutan melalui akselerasi transformasi bisnis” PT BKI sebagai salah satu Lembaga Verifikasi Independen yang di tunjuk oleh Kementerian Perindustrian Republik Indonesia menghadirkan layanan TKDN BKI. Dengan mengadopsi dan mengedepankan nilai-nilai utama AKHLAK (Amanah, Kompeten, Harmonis, Loyal, Adaptif dan Kolaboratif) secara utuh dan konsistensi, digitalisasi proses sertifikasi TKDN menjadikan layanan TKDN BKI menjadi lebih CEPAT, AKUNTABEL, dan TRANSPARAN.
                        PT Biro Klasifikasi Indonesia (Persero) didukung sumber daya manusia yang kompeten dan jaringan cabang yang tersebar diseluruh Indonesia menetapkan standard layanan sertifikasi TKDN yang bermutu tinggi. 34 Cabang PT Biro Klasifikasi Indonesia (Persero) hadir di seluruh wilayah Indonesia untuk memberikan layanan ke seluruh pelosok penjuru negeri.
                    </p>
                    <br>
                    <h5>Manfaat TKDN?</h5>
                    <p>
                        Dengan Sertifikasi TKDN akan meningkatkan kapabilitas dan kemandirian industri di Indonesia untuk dapat menjadi tuan Rumah di negeri sendiri. Peningkatan Penggunaan Produk Dalam Negeri akan meningkatkan pertumbuhan ekonomi nasional. Hilirisasi Industri dengan mengolah sumber daya alam Indonesia yang berlimpah untuk meningkatkan kemapuan dan kemandirian ekonomi Indonesia.
                    </p>

                </div>
                <div class="col-xl-4 col-md-12 col-sm-12">
                    <div class="fill">
                        <img src="{{ asset('landing/assets/images/environmental-pollution-industry-exterior-daylight.jpg') }}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="about" class="about-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-image wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <img src="{{ asset('landing/assets/images/about-left-image.png') }}" alt="person graphic">
                    </div>
                </div>
                <div class="col-lg-8 align-self-center">
                    <div class="services">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
                                    <div class="right-text">
                                        <h4>Tentang Kami</h4>
                                        <p>PT Biro Klasifikasi Indonesia (Persero) merupakan Induk Holding Perusahaan Jasa Survey BUMN di Indonesia yang berdiri sejak 01 Juli 1964. Dengan semangat “Pertumbuhan berkelanjutan melalui akselerasi transformasi bisnis” PT BKI sebagai salah satu Lembaga Verifikasi Independen yang di tunjuk oleh Kementerian Perindustrian Republik Indonesia menghadirkan layanan TKDN BKI. Dengan mengadopsi dan mengedepankan nilai-nilai utama <strong>AKHLAK</strong> (Amanah, Kompeten, Harmonis, Loyal, Adaptif dan Kolaboratif) secara utuh dan konsistensi, digitalisasi proses sertifikasi TKDN menjadikan layanan TKDN BKI menjadi lebih <strong>CEPAT, AKUNTABEL, dan TRANSPARAN</strong>. <br>
                                            PT Biro Klasifikasi Indonesia (Persero) didukung sumber daya manusia yang kompeten dan jaringan cabang yang tersebar diseluruh Indonesia menetapkan standard layanan sertifikasi TKDN yang bermutu tinggi. 34 Cabang PT Biro Klasifikasi Indonesia (Persero) hadir di seluruh wilayah Indonesia untuk memberikan layanan ke seluruh pelosok penjuru negeri.<br>
                                            Dengan Sertifikasi TKDN akan meningkatkan kapabilitas dan kemandirian industri di Indonesia untuk dapat menjadi tuan Rumah di negeri sendiri. Peningkatan Penggunaan Produk Dalam Negeri akan meningkatkan pertumbuhan ekonomi nasional. Hilirisasi Industri dengan mengolah sumber daya alam Indonesia yang berlimpah untuk meningkatkan kemapuan dan kemandirian ekonomi Indonesia.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- <div id="services" class="our-services section">
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
    </div> --}}

    <div id="portfolio" class="our-portfolio section" style="padding-bottom: 100px">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading  wow bounceIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <h2>Rekapitulasi Proses Pekerjaan <em>Verifikasi</em> <span>Sertifikat</span> TKDN</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="{{ asset('landing/assets/images/service-icon-01.png') }}" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Verifikasi</h5>
                                    <h3>200</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="{{ asset('landing/assets/images/service-icon-02.png') }}" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Produk Verifikasi</h5>
                                    <h3>200</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="{{ asset('landing/assets/images/service-icon-03.png') }}" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Product</h5>
                                    <h3>200</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="{{ asset('landing/assets/images/service-icon-04.png') }}" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Sertifikat/</h5>
                                    <h3>200</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="contact" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center wow fadeInLeft" data-wow-duration="0.5s" data-wow-delay="0.25s">
                    <div class="section-heading text-white">
                        <h4>Kontak Kami :</h4>
                        <h2>PT. Biro Klasifikasi Indonesia (PERSERO)</h2><br>
                        <h4>Alamat :</h4>
                        <p style="margin-top: 0px;">Departemen Operasi Bisnis Komersil, PMU Verifikasi & Validasi,
                            Gedung Kantor Pusat Lt. 5, PT Biro Klasifikasi Indonesia (Persero)
                            Jl. Yos Sudarso No.38-40, Tanjung Priok, Jakarta Utara - INDONESIA
                        </p><br>
                        <i class="fa fa-phone" aria-hidden="true"></i> &nbsp; +62 21 4301017 ext 8888<br>
                        <i class="fa fa-envelope" aria-hidden="true"></i> &nbsp; tkdn@bki.co.id<br>
                        <i class="fa fa-whatsapp" aria-hidden="true"></i> &nbsp; 0812 9500 1964; 0812 6600 1964<br>
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
                <div class="col-lg-3 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.25s">
                    <img src="{{ asset('assets/images/bki-logo-new.png') }}" alt="" style="max-width: 150px; margin-bottom: 30px">
                </div>
                <div class="col-lg-9 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.25s">
                    <p>© Copyright <?php $year = date('Y');
                    echo $year; ?> PT. Biro Klasifikasi Indonesia, All Rights Reserved.

                        {{-- <br>Develop by : <a rel="nofollow" href="https://tigasatu.co.id">PT. Tiga Satu Cipta Solusi</a> --}}
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Scripts -->
    <script src="{{ asset('landing/vendor/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('landing/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('landing/assets/js/owl-carousel.js') }}"></script>
    <script src="{{ asset('landing/assets/js/animation.js') }}"></script>
    <script src="{{ asset('landing/assets/js/imagesloaded.js') }}"></script>
    <script src="{{ asset('landing/assets/js/templatemo-custom.js') }}"></script>

</body>

</html>
