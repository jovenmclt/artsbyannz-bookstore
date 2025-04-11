<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userCarts="userCarts" />
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h1 class="fw-light text-white">UNIQUE PREMADE COVERS</h1>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getUnique, index) in get_uniqueItems" :key="index">
                            <div class="text-center mt-5">
                                <inertiaLink :href="`/viewitem/${getUnique.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getUnique.file_image}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getUnique.title }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getUnique.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getUnique.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <footervue />
            </main>
        </div>
    </div>
</template>

<script>
import Navbar from '../Navbar/Navigation.vue'
import footervue from '../Footer/footer.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'cUniquePremade',
    components: { Navbar, footervue , inertiaLink},
    props: { get_uniqueItems: Object, userCarts:Object },
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}

img:hover {
    opacity: 50%;
    transition: 0.5s;
}
</style>
