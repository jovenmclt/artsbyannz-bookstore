<template>
    <div class="text-center mt-2 text-decoration-none py-3 d-lg-block d-none">
        <img src="./Assets/logo.png" alt="" width="250">
    </div>
    <nav class="navbar navbar-expand-lg col-11">
        <button @click="btnNav" class="btn navbar-toggler shadow-none bg-white " type="button" data-bs-toggle="collapse"
            data-bs-target="#mainNav">
            <span class="navbar-toggler-icon bg-white" v-if="!navIcon"></span>
            <i class="bi bi-x fs-2 bg-transparent text-dark" v-if="navIcon"></i>
        </button>
        <div class="text-center mt-2 text-decoration-none py-3 d-lg-none d-block">
            <img src="./Assets/logo.png" alt="" width="190">
        </div>
        <div class="text-end d-lg-none d-block ">
            <inertiaLink href="/membershipdashboard" class="text-secondary">
                <span class="text-white"><i class="bi bi-person fs-3 me-3 font-hover"></i></span>
            </inertiaLink>
            <a href="#" class="text-secondary">
                <span class="text-white "><i class="bi bi-cart2 fs-3 font-hover"><sup class="fs-6">0</sup></i></span>
            </a>
        </div>
        <div class="collapse navbar-collapse justify-content-center align-items-center" id="mainNav">
            <ul class="navbar-nav text-center ps-lg-5 ">
                <li class="nav-item">
                    <inertiaLink href="/" class="nav-link text-white text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Home</span>
                    </inertiaLink>
                </li>
                <li class="nav-item">
                    <a href="https://www.artsbyannz.com/" target="_blank" class="nav-link text-white  text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Portfolio</span>
                    </a>
                </li>
                <li class="nav-item">
                    <inertiaLink href="/allproducts" class="nav-link text-white  text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">All Products</span>
                    </inertiaLink>
                </li>
                <li class="nav-item">
                    <inertiaLink href="/premadecovers" class="nav-link text-white  text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Premade Covers</span>
                    </inertiaLink>
                </li>
                <li class="nav-item">
                    <inertiaLink href="/premadewallpapers" class="nav-link text-white  text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Wallpapers</span>
                    </inertiaLink>
                </li>
                <li class="nav-item">
                    <inertiaLink href="/membership" class="nav-link text-white  text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Membership</span>
                    </inertiaLink>
                </li>
            </ul>
        </div>
        <div class="text-end d-lg-block d-none">
            <inertiaLink href="/membershipdashboard" class="text-secondary">
                <span class="text-white"><i class="bi bi-person fs-3 me-3 font-hover"></i></span>
            </inertiaLink>
            <inertiaLink href="/cart" class="text-secondary">
                <span class="text-white "><i class="bi bi-cart2 fs-3 font-hover"><sup class="fs-6">{{ userCarts.length }}</sup></i></span>
            </inertiaLink>
        </div>
    </nav>
</template>

<script>
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'Navigation',
    components: { inertiaLink },
    props:{userCarts:Object},
    data() {
        return {
            navIcon: false
        }
    },
    methods: {
        btnNav() {
            this.navIcon = !this.navIcon
        }
    }
}
</script>

<style>
.font-hover:hover {
    color: rgb(205, 212, 212);
}
</style>
