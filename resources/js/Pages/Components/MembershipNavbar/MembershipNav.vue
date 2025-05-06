<template>
    <nav class="navbar navbar-expand-lg col-12 px-4 position-fixed top-0 z-3">
        <a href="#" class="text-start mt-2 text-decoration-none py-3 d-lg-block d-none ">
            <img src="./Assets/logo.png" alt="" width="150">
        </a>
        <button @click="btnNav" class="btn navbar-toggler shadow-none bg-white " type="button" data-bs-toggle="collapse"
            data-bs-target="#mainNav">
            <span class="navbar-toggler-icon bg-white" v-if="!navIcon"></span>
            <i class="bi bi-x fs-2 bg-transparent text-dark" v-if="navIcon"></i>
        </button>
        <div class="text-center mt-2 text-decoration-none py-3 d-lg-none d-block">
            <img src="./Assets/logo.png" alt="" width="190">
        </div>
        <div class="text-end d-lg-none d-block ">
            <div class="btn-group dropstart bg-transparent" v-if="userIds">
                <div class=" bg-transparent pe-md-3" data-bs-toggle="dropdown">
                    <div v-if="rfile_profile">
                        <img :src="`/storage/${rfile_profile}`" class="rounded-pill bg-transparent"
                            style="cursor: pointer;" alt="" width="40" height="40">
                    </div>
                    <div v-if="!rfile_profile">
                        <i class="bi bi-person fs-3 px-2 text-white bg-secondary rounded-5 "
                            style="cursor: pointer;"></i>
                    </div>
                </div>
                <ul class="dropdown-menu mt-5 bg-dark px-2 rounded-4" style="width: 200px;">
                    <li class="bg-transparent py-2">
                        <div v-if="rfile_profile" class="bg-transparent">
                            <img :src="`/storage/${rfile_profile}`" alt="" width="30" height="30"
                                class="rounded-5 ms-2 bg-transparent">
                            <span class="fw-light text-white ms-2 bg-transparent">{{ rusername }}</span>
                        </div>
                        <div v-if="!rfile_profile" class="bg-transparent">
                            <i class="bi bi-person fs-3 px-2 text-white bg-secondary rounded-5 "
                                style="cursor: pointer;"></i>
                            <span class="fw-light text-white ms-2 bg-transparent">{{ rusername }}</span>
                        </div>
                    </li>
                    <li class="bg-transparent py-2">
                        <inertiaLink href="/memberprofile" class="dropdown-item text-white bg-transparent">Profile
                        </inertiaLink>
                    </li>
                    <li class="bg-transparent border-secondary border-bottom border-top py-2">
                        <inertiaLink href="/memberBilling" class="dropdown-item text-white bg-transparent">Billing </inertiaLink>
                    </li>
                    <li class="bg-transparent">
                        <a href="#" class="dropdown-item text-white bg-transparent" @click="btnLogout"><i
                                class="bi bi-box-arrow-left fs-6 bg-transparent"> Sign out</i></a>
                    </li>
                </ul>
            </div>
            <inertiaLink href="/loginmember" class="text-secondary" v-if="!userIds">
                <span class="text-white"><i class="bi bi-person-circle fs-3 me-3 font-hover"></i></span>
            </inertiaLink>
            <inertiaLink href="/cart" class="text-secondary d-md-inline d-none">
                <span class="text-white "><i class="bi bi-cart2 fs-3 font-hover"><sup class="fs-6">{{ userCarts.length }}</sup></i></span>
            </inertiaLink>
        </div>
        <div class="collapse navbar-collapse justify-content-center align-items-center " id="mainNav">
            <ul class="navbar-nav text-start pe-xl-5">
                <li class="nav-item">
                    <inertiaLink href="/" class="nav-link text-white text-decoration-none mx-md-2">
                        <span class="fs-6 font-hover">Home</span>
                    </inertiaLink>
                </li>
                <li class="nav-item">
                    <a href="https://www.artsbyannz.com/" target="_blank"
                        class="nav-link text-white  text-decoration-none mx-md-2">
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
            <div class="btn-group dropstart bg-transparent" v-if="userIds">
                <div class=" bg-transparent pe-md-3" data-bs-toggle="dropdown">
                    <div v-if="rfile_profile">
                        <img :src="`/storage/${rfile_profile}`" class="rounded-pill bg-transparent"
                            style="cursor: pointer;" alt="" width="40" height="40">
                    </div>
                    <div v-if="!rfile_profile">
                        <i class="bi bi-person fs-3 px-2 text-white bg-secondary rounded-5 "
                            style="cursor: pointer;"></i>
                    </div>
                </div>
                <ul class="dropdown-menu mt-5 bg-dark rounded-4 px-3" style="width: 200px;">
                    <li class="bg-transparent py-2">
                        <div v-if="rfile_profile" class="bg-transparent">
                            <img :src="`/storage/${rfile_profile}`" alt="" width="30" height="30"
                                class="rounded-5 ms-2 bg-transparent">
                            <span class="fw-light text-white ms-2 bg-transparent">{{ rusername }}</span>
                        </div>
                        <div v-if="!rfile_profile" class="bg-transparent">
                            <i class="bi bi-person fs-3 px-2 text-white bg-secondary rounded-5 "
                                style="cursor: pointer;"></i>
                            <span class="fw-light text-white ms-2 bg-transparent">{{ rusername }}</span>
                        </div>
                    </li>
                    <li class="bg-transparent py-2">
                        <inertiaLink href="/memberprofile" class="dropdown-item text-white bg-transparent">Profile
                        </inertiaLink>
                    </li>
                    <li class="bg-transparent border-secondary border-bottom border-top py-2">
                        <inertiaLink href="/memberBilling" class="dropdown-item text-white bg-transparent">Billing</inertiaLink>
                    </li>
                    <li class="bg-transparent">
                        <a href="#" class="dropdown-item text-white bg-transparent" @click="btnLogout"><i
                                class="bi bi-box-arrow-left fs-6 bg-transparent"> Sign out</i></a>
                    </li>
                </ul>
            </div>
            <inertiaLink href="/loginmember" class="text-secondary" v-if="!userIds">
                <span class="text-white"><i class="bi bi-person-circle fs-3 me-3 font-hover"></i></span>
            </inertiaLink>
            <inertiaLink href="/cart" class="text-secondary d-xl-inline d-none">
                <span class="text-white "><i class="bi bi-cart2 fs-3 font-hover"><sup class="fs-6">{{ userCarts.length }}</sup></i></span>
            </inertiaLink>
        </div>
    </nav>
    <nav class="col-xl-3 col-md-4 min-vh-100 py-5 px-3 position-fixed start-0 z-2 d-none d-lg-block">
        <div class="text-center mt-5" v-if="userIds">
            <br>
            <inertiaLink href="/memberprofile" class="text-decoration-none">
                <div v-if="rfile_profile">
                    <img :src="`/storage/${rfile_profile}`" alt="" style="border-radius: 50px;" width="100"
                        height="100">
                </div>
                <div class="mb-4" v-if="!rfile_profile">
                    <i class="bi bi-person fs-1 text-white bg-secondary px-4 py-3 rounded-5 "></i>
                </div>
                <h5 class="fw-semibold text-white mt-3">{{ rfullname }}</h5>
            </inertiaLink>
            <inertiaLink href="/memberMessage">
                <button class="btn btn-outline-secondary px-4 py-2 rounded-5"><i class="bi bi-chat-left bg-transparent"></i> Messages</button>
            </inertiaLink>
        </div>
        <div class="text-center mt-5" v-if="!userIds">
            <br><br>
            <div class="mb-4">
                <i class="bi bi-person fs-1 text-white bg-secondary px-4 py-3 rounded-5 "></i>
            </div>
            <inertiaLink href="/membership" class="text-decoration-none mt-3">
                <button class="btn shadow-none px-5 py-2 rounded-5 text-white fw-semibold"
                    style="background-color: #B38ED1;"> Join now</button>
            </inertiaLink>
            <p class="fw-light text-white mt-3">Have an account? <inertiaLink href="/loginmember"
                    class="text-decoration-none text-white fw-semibold"> Login</inertiaLink>
            </p>
        </div>
    </nav>
</template>

<script>
import { Link as inertiaLink } from '@inertiajs/vue3'
import { router } from '@inertiajs/vue3'
export default {
    name: 'Navigation',
    components: { inertiaLink },
    props: { userIds: Number, userInfos: Object , userCarts:Object},
    data() {
        return {
            navIcon: false,
            rusername: this.userInfos ? this.userInfos.username : '',
            rfullname: this.userInfos ? this.userInfos.fullname : '',
            rfile_profile: this.userInfos ? this.userInfos.file_profile : ''
        }
    },
    methods: {
        btnNav() {
            this.navIcon = !this.navIcon
        },
        btnLogout() {
            router.post('/logouts');
        },
    }
}
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

nav {
    font-family: "Poppins", serif;
    overflow-wrap: break-word;
}
</style>
