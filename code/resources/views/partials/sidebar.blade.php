<div class="sticky">
    <div class="app-sidebar__overlay" data-bs-toggle="sidebar"></div>
    <div class="app-sidebar">
        <div class="side-header">
            <a class="header-brand1" href="/">
                <img src="{{ asset('assets/images/tkdn-bki.png') }}" style="max-width: 80px;" class="header-brand-img desktop-logo" alt="logo">
                <img src="{{ asset('assets/images/tkdn-bki.png') }}" style="max-width: 50px;" class="header-brand-img toggle-logo" alt="logo">
                <img src="{{ asset('assets/images/tkdn-bki.png') }}" style="max-width: 50px;" class="header-brand-img light-logo" alt="logo">
                <img src="{{ asset('assets/images/tkdn-bki.png') }}" style="max-width: 80px;" class="header-brand-img light-logo1" alt="logo">
            </a>
            <!-- LOGO -->
        </div>
        <div class="main-sidemenu">
            <div class="slide-left disabled" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z" />
                </svg></div>
            <ul class="side-menu">
                <li class="sub-category">
                    <h3>Dashboard</h3>
                </li>
                @role('superadmin|administrator|assessor|qc-officer|kepala-verifikasi|guest')
                    <li class="slide">
                        <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('dashboard') }}"><i class="side-menu__icon lnr lnr-pie-chart"></i><span class="side-menu__label">Dashboard</span></a>
                    </li>
                    <li class="sub-category">
                        <h3>Main</h3>
                    </li>
                    <li class="slide">
                        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">List Permohonan</span><i class="angle fe fe-chevron-right"></i></a>
                        <ul class="slide-menu">
                            <li class="slide">
                                <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('requests.index') }}">
                                    <span class="side-menu__label">Permohonan Diterima</span>
                                </a>
                            </li>
                            <li class="slide">
                                <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('requests.index-tolak') }}">
                                    <span class="side-menu__label">Permohonan Ditolak</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="slide">
                        <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('projects.index') }}"><i class="side-menu__icon fe fe-clipboard"></i><span class="side-menu__label">Proses Verifikasi</span></a>
                    </li>
                    <li class="slide">
                        <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('projects.persetujuan') }}"><i class="side-menu__icon fe fe-user-check"></i><span class="side-menu__label">Persetujuan Pemohon</span></a>
                    </li>
                    <li class="slide">
                        <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('projects.tracking') }}"><i class="side-menu__icon fe fe-search"></i><span class="side-menu__label">Tracking Review</span></a>
                    </li>
                    <li class="slide">
                        <a class="side-menu__item has-link" data-bs-toggle="slide" href="{{ route('projects.terbit') }}"><i class="side-menu__icon fe fe-file-text"></i><span class="side-menu__label">Sertifikat Terbit</span></a>
                    </li>
                @endrole
                @role('superadmin')
                    <li class="sub-category">
                        <h3>Master Data</h3>
                    </li>
                    <li>
                        <a class="side-menu__item has-link" href="{{ route('user.index') }}"><i class="side-menu__icon fe fe-users"></i><span class="side-menu__label">User Mgt.</span></a>
                    </li>
                    <li>
                        <a class="side-menu__item has-link" href="{{ route('role.index') }}"><i class="side-menu__icon fe fe-user-check"></i><span class="side-menu__label">Role Mgt.</span></a>
                    </li>
                    <li>
                        <a class="side-menu__item has-link" href="{{ route('logs.index') }}"><i class="side-menu__icon fe fe-list"></i><span class="side-menu__label">Logs</span></a>
                    </li>
                    <li>
                        <a class="side-menu__item has-link" href="{{ route('whitelist-ip.index') }}"><i class="side-menu__icon fe fe-globe"></i><span class="side-menu__label">Whitelist IP</span></a>
                    </li>
                    <li>
                        <a class="side-menu__item has-link" href="{{ route('status.index') }}"><i class="side-menu__icon  fe fe-list"></i><span class="side-menu__label">Status</span></a>
                    </li>
                @endrole
            </ul>
            <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z" />
                </svg></div>
        </div>
    </div>
</div>
