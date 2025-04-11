<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navigation :userCarts="userCarts"/>
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h1 class="fw-light text-white">ALL PRODUCTS</h1>
                        </div>
                        <div class="col-xl-3 col-md-6" v-for="(getallItems, index) in get_allPremades" :key="index">
                            <div class="text-center mt-5">
                                <inertiaLink :href="`/viewitem/${getallItems.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getallItems.file_image}`" class="rounded-4" alt="" width="300" height="350">
                                    <h5 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getallItems.title }}</h5>
                                    <span class="fw-light text-secondary"><del>${{ getallItems.original_price }}</del></span>
                                    <span class="fw-light text-white"> ${{ getallItems.discount_price }}</span>
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
import Navigation from '../Navbar/Navigation.vue'
import footerVue from '../Footer/footer.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'cAllProducts',
    components: { Navigation, inertiaLink, footerVue },
    props:{get_allPremades:Array, userCarts:Object},

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
