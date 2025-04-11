<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images"/>
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Book shop > View</span>
                            </a>
                            <div class="d-md-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white ">Premade {{ rtype }}</h4>
                                <inertiaLink href="/admin/additem" class="text-decoration-none">
                                    <button class="btn btn-dark border-secondary me-xl-5 rounded-3">Add New</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-6 mt-xl-0 mt-2">
                            <div class="text-start">
                                <img :src="`/storage/${rfile_image}`" alt="" class="w-100 h-100 rounded-4">
                            </div>
                        </div>
                        <div class="col-xl-6 mt-xl-0 mt-2">
                            <div class="text-start">
                                <h2 class="fw-semibold text-white">{{ rtitle }}</h2>
                                <div class="d-flex gap-2">
                                    <h4 class="fw-light text-secondary"><del>${{ rorigPrice }}</del></h4>
                                    <h4 class="fw-light text-white">${{ rdiscountPrice }}</h4>
                                </div>
                                <p class="fw-light text-white" style="font-size: 15px;" v-html="rdescription"></p>
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
    name: 'cAdminViewItem',
    components: { AdminNavigation, inertiaLink },
    props: { premadeItems: Object , getcAdmin_images:Object},
    data() {
        return {
            rfile_image: this.premadeItems ? this.premadeItems.file_image : '',
            rtype: this.premadeItems ? this.premadeItems.type : '',
            rtitle: this.premadeItems ? this.premadeItems.title : '',
            rorigPrice: this.premadeItems ? this.premadeItems.original_price : '',
            rdiscountPrice: this.premadeItems ? this.premadeItems.discount_price : '',
            rdescription: this.premadeItems ? this.premadeItems.description.replace(/(\r\n|\n|\r)/g,'<br>') : '',
        }
    },
    methods: {
        getImage(filepath) {
            return `/storage/${filepath}`;
        }
    }
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
