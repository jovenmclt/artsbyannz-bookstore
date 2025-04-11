<template>
    <div class="text-center">
        <a href="#">
            <i class="bi bi-instagram text-white fs-5"></i>
        </a>
    </div>
    <nav class="col-auto navbar navbar-expand-md justify-content-center align-items-center ">
        <ul class="navbar-nav text-center">
            <li class="nav-item">
                <inertiaLink href="#" class="nav-link text-white text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Website</span>
                </inertiaLink>
            </li>
            <li class="nav-item">
                <a href="https://www.artsbyannz.com/" target="_blank"
                    class="nav-link text-white  text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Tips & Donations</span>
                </a>
            </li>
            <li class="nav-item">
                <inertiaLink href="#" class="nav-link text-white  text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Contact</span>
                </inertiaLink>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link text-white  text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Terms of Service</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link text-white  text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Privacy & Policy</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link text-white  text-decoration-none mx-md-2">
                    <span class="fs-6 font-hover">Return & FAQ</span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="text-center ">
        <p class="fw-semibold text-secondary me-3" style="font-size: 13px;">© 2025 All rights reserved Ann Joven (artsbyannz)</p>
        <p class="fw-bold text-secondary me-3" style="font-size: 13px;"> Developed By jovenmiclatt.</p>
    </div>
</template>

<script>
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'Navigation',
    components: { inertiaLink },
    data() {
        return {

        }
    },

}
</script>

<style>
.font-hover:hover {
    color: rgb(205, 212, 212);
}
</style>
