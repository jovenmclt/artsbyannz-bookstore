<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userCarts="userCarts"/>
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h1 class="fw-light text-white">ALL PREMADE BOOK COVERS</h1>
                        </div>
                        <div class="col-xl-3 col-md-6" v-for="(get_premadeCovers, index) in get_premadeCoverss" :key="index">
                            <div class="text-center mt-5">
                                <inertiaLink :href="`/viewitem/${get_premadeCovers.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${get_premadeCovers.file_image}`" class="rounded-4" alt="" width="300" height="350">
                                    <h5 class="fw-light text-white mt-3" style="font-size: 14px;">{{ get_premadeCovers.title }}</h5>
                                    <span class="fw-light text-secondary"><del>${{ get_premadeCovers.original_price }}</del></span>
                                    <span class="fw-light text-white"> ${{ get_premadeCovers.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <footerVue />
            </main>
        </div>
    </div>
</template>

<script>
import footerVue from '../Footer/footer.vue'
import Navbar from '../Navbar/Navigation.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'cPremadeCovers',
    components: { Navbar, footerVue , inertiaLink},
    props:{get_premadeCoverss:Object, userCarts:Object}
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}

img:hover{
    opacity: 50%;
    transition: 0.5s;
}
</style>
