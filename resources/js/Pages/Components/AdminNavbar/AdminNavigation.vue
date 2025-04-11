<template>
    <nav class="navbar px-md-4 py-2 px-lg-2 px-3 border-dark border-bottom shadow position-fixed start-0 z-2">
        <button class="btn navbar-toggler shadow-none bg-white d-md-none d-block" @click="btnTogglenav"
            data-bs-toggle="collapse" data-bs-target="#nav1">
            <span v-if="!showNav" class="navbar-toggler-icon bg-white"></span>
            <span v-if="showNav" class="bg-transparent"><i class="bi bi-x bg-transparent fs-2"></i></span>
        </button>
        <a href="#" class="navbar-brand bg-transparent text-decoration-none mt-2 ">
            <img :src="`/storage/${rAdmin_logo}`" alt="" width="200">
        </a>
        <div class="justify-content-end align-items-center bg-transparent">
            <div class="btn-group dropstart bg-transparent">
                <div class=" bg-transparent pe-md-3" data-bs-toggle="dropdown">
                    <img :src="`/storage/${rAdmin_profile}`" class="rounded-pill bg-transparent"
                        style="cursor: pointer;" alt="" width="40" height="40">
                </div>
                <ul class="dropdown-menu mt-5 bg-dark px-2 rounded-4">
                    <li class="bg-transparent border-secondary border-bottom py-2">
                        <img :src="`/storage/${rAdmin_profile}`" alt="" width="30" height="30" class="rounded-5 ms-2 ">
                        <span class="fw-light text-white ms-2 bg-transparent">artsbyannz</span>
                    </li>
                    <li class="bg-transparent border-secondary border-bottom py-2">
                        <inertiaLink :href="`/admin/privacySettings`" class="dropdown-item text-white bg-transparent"><i
                                class="bi bi-gear bg-transparent"> Privacy & Settings</i></inertiaLink>
                    </li>
                    <li class="bg-transparent">
                        <a href="#" class="dropdown-item text-white bg-transparent" @click="btnLogout"><i
                                class="bi bi-box-arrow-left fs-6 bg-transparent"> Sign out</i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="collapse navbar-collapse justify-content-start align-items-center" id="nav1">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <div class="text-center nav-hover">
                        <inertiaLink href="/admin/dashboard" class="nav-link bg-transparent text-white">
                            <i class="bi bi-house bg-transparent me-2">
                                <span class="bg-transparent"> Dashboard</span>
                            </i>
                        </inertiaLink>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="text-center nav-hover ">
                        <inertiaLink href="/admin/bookshop" class="nav-link bg-transparent text-white">
                            <i class="bi bi-clipboard-minus me-2 bg-transparent">
                                <span class="bg-transparent"> Book Shop</span>
                            </i>
                        </inertiaLink>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="text-center nav-hover px-2">
                        <inertiaLink href="/admin/membership" class="nav-link bg-transparent text-white">
                            <i class="bi bi-star-half me-2 bg-transparent">
                                <span class="bg-transparent"> Membership</span>
                            </i>
                        </inertiaLink>
                    </div>
                </li>
                <li class="nav-item mt-3 ">
                    <a class="text-decoration-none text-white d-flex gap-5 justify-content-center"
                        data-bs-toggle="collapse" href="#collapseNav" aria-expanded="false"
                        aria-controls="collapseExample">
                        <span>Store</span>
                        <i class="bi bi-caret-down text-white"></i>
                    </a>
                    <div class="collapse " id="collapseNav">
                        <ul class="navbar-nav pt-4">
                            <li class="nav-item">
                                <div class="text-center nav-hover">
                                    <a href="#" class="nav-link text-white bg-transparent"><i
                                            class="bi bi-cart bg-transparent me-2">
                                            <span class="bg-transparent"> Orders</span></i></a>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav pt-3">
                            <li class="nav-item">
                                <div class="text-center nav-hover">
                                    <a href="#" class="nav-link text-white"><i
                                            class="bi bi-dropbox me-2 bg-transparent"> <span class="bg-transparent">
                                                Process</span></i></a>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav pt-3">
                            <li class="nav-item">
                                <div class="text-center nav-hover">
                                    <a href="#" class="nav-link text-white"><i
                                            class="bi bi-check-lg me-2 bg-transparent">
                                            <span class="bg-transparent"> Completed</span></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <nav class="col-xl-2 col-3 shadow py-5 px-3 position-fixed start-0 z-1 d-none d-md-flex flex-column justify-content-between pb-0" style="height: 100vh; overflow-y: auto;">
        <ul class="navbar-nav flex-column pt-5">
            <li class="nav-item">
                <div class="text-start nav-hover px-2">
                    <inertiaLink href="/admin/dashboard" class="nav-link bg-transparent text-white">
                        <i class="bi bi-house bg-transparent me-2"></i>
                        <span class="bg-transparent">Dashboard</span>
                    </inertiaLink>
                </div>
            </li>
            <li class="nav-item">
                <div class="text-start nav-hover px-2">
                    <inertiaLink href="/admin/membership" class="nav-link bg-transparent text-white">
                        <i class="bi bi-star me-2 bg-transparent"></i>
                        <span class="bg-transparent">Membership</span>
                    </inertiaLink>
                </div>
            </li>
            <li class="nav-item">
                <div class="text-start nav-hover px-2">
                    <inertiaLink href="/admin/donation" class="nav-link bg-transparent text-white">
                        <i class="bi bi-currency-dollar me-2 bg-transparent"></i>
                        <span class="bg-transparent">Donation</span>
                    </inertiaLink>
                </div>
            </li>
            <li class="nav-item mt-4">
                <a class="text-decoration-none px-2 text-white d-flex justify-content-between" data-bs-toggle="collapse"
                    href="#collapseNav" aria-expanded="true" aria-controls="collapseExample">
                    <span style="font-size: 14px;">Store Management</span>
                    <i class="bi bi-caret-down text-white"></i>
                </a>
                <div class="collapse show" id="collapseNav">
                    <ul class="navbar-nav pt-2">
                        <li class="nav-item">
                            <div class="text-start nav-hover px-2">
                                <inertiaLink href="/admin/bookshop" class="nav-link bg-transparent text-white">
                                    <i class="bi bi-clipboard-minus me-2 bg-transparent"></i>
                                    <span class="bg-transparent">Book Shop</span>
                                </inertiaLink>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav pt-2">
                        <li class="nav-item">
                            <div class="text-start nav-hover px-2">
                                <inertiaLink href="/admin/orders" class="nav-link text-white bg-transparent">
                                    <i class="bi bi-cart bg-transparent me-2"></i>
                                    <span class="bg-transparent">Orders</span>
                                </inertiaLink>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav pt-2">
                        <li class="nav-item">
                            <div class="text-start nav-hover px-2">
                                <inertiaLink href="/admin/customers" class="nav-link text-white">
                                    <i class="bi bi-people bg-transparent me-2"></i>
                                    <span class="bg-transparent">Customers</span>
                                </inertiaLink>
                            </div>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav flex-column mt-4">
            <li class="nav-item border-top">
                <div class="text-start nav-hover px-2 mt-2">
                    <inertiaLink href="/admin/dashboard" class="nav-link bg-transparent text-white">
                        <i class="bi bi-chat-dots bg-transparent me-2"></i>
                        <span class="bg-transparent">Messsage <sup class="bg-transparent">10</sup></span>
                    </inertiaLink>
                </div>
            </li>
            <li class="nav-item">
                <div class="text-start nav-hover px-2 mt-1">
                    <inertiaLink href="/admin/privacySettings" class="nav-link bg-transparent text-white">
                        <i class="bi bi-gear bg-transparent me-2"></i>
                        <span class="bg-transparent">Settings</span>
                    </inertiaLink>
                </div>
            </li>
            <li class="nav-item">
                <div class="border border-secondary rounded nav-hover px-2 py-2 mt-2" data-bs-toggle="dropdown" style="cursor: pointer;" >
                    <div class=" bg-transparent">
                        <img :src="`/storage/${rAdmin_profile}`" class="rounded-pill bg-transparent" alt="" width="30" height="30">
                        <span class="fw-light text-white ms-2 bg-transparent">{{ rAdmin_username }}  <i class="bi bi-caret-down text-white bg-transparent"></i></span>
                    </div>
                </div>
                <div class="btn-group dropstart bg-transparent" v-if="!showNav">
                    <ul class="dropdown-menu bg-dark px-2 rounded-4">
                        <li class="bg-transparent">
                            <a href="#" class="dropdown-item text-white bg-transparent" @click="btnLogout"><i
                                    class="bi bi-box-arrow-left fs-6 bg-transparent"> Sign out</i></a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
</template>

<script>
import { router } from '@inertiajs/vue3'
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'AdminNavigation',
    components: { inertiaLink },
    props: { propsAdmin_images: Object },
    data() {
        return {
            showNav: false,
            rAdmin_profile: this.propsAdmin_images ? this.propsAdmin_images.file_profile : '',
            rAdmin_logo: this.propsAdmin_images ? this.propsAdmin_images.file_logo : '',
            rAdmin_username: this.propsAdmin_images ? this.propsAdmin_images.username : ''
        }
    },
    methods: {
        btnLogout() {
            router.post('/logout');
        },
        btnTogglenav() {
            this.showNav = !this.showNav;
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

nav,
div {
    font-family: "Poppins", serif;
}

.nav-hover:hover {
    background-color: rgb(101, 105, 104);
    border-radius: 10px;
    transition: .2s;
}
</style>
