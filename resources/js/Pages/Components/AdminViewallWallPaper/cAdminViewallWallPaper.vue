<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images"/>
            <main class="col-xl-10 col-md-9 ms-auto px-3">
                <section class="" id="sec1">
                    <div class="row justify-content-center">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Book shop > View All</span>
                            </a>
                            <div class="d-md-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white ">All Premade Wall Papers</h4>
                                <inertiaLink href="/admin/additem" class="text-decoration-none">
                                    <button class="btn btn-dark border-secondary me-xl-5 rounded-3">Add New</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-auto" v-for="(getPremade, index) in allPremadeWallpapers" :key="index">
                            <div class="text-center mt-4 ">
                                <inertiaLink :href="`/viewItem/${getPremade.id}`">
                                    <img :src="`/storage/${getPremade.file_image}`" class="rounded" alt="" width="345"
                                        height="370">
                                </inertiaLink>
                                <p class="fw-light text-white mt-2" style="font-size: 13px;">{{ getPremade.title }}</p>
                                <div class="d-flex justify-content-center gap-2">
                                    <p class="fw-light text-secondary" style="font-size: 13px;"><del>${{
                                        getPremade.original_price }}</del></p>
                                    <p class="fw-semibold text-white " style="font-size: 13px;">${{
                                        getPremade.discount_price }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue';
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'ccAdminViewallWallPaper',
    components:{AdminNavigation, inertiaLink},
    props: {allPremadeWallpapers:Object, getcAdmin_images:Object}
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

#sec1 {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}

section {
    font-family: "Poppins", serif;
    padding: calc(20px + 1rem) 0;
}
</style>
