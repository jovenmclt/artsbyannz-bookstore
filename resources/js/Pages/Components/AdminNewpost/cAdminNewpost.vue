<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <AdminNavigation :propsAdmin_images="getcAdmin_images" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section id="sec1">
                    <div class="row justify-content-start px-md-3 px-2">
                        <div class="text-start py-4">
                            <inertiaLink href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Membership > New post</span>
                            </inertiaLink>
                            <h2 class="fw-semibold text-white py-3">
                                Make new premade post
                            </h2>
                        </div>
                        <div class="col-xl-11 col-md-12 py-5 px-md-5 px-3 bg-dark ms-xl-2 rounded-4">
                            <div class="d-flex justify-content-between bg-transparent">
                                <div class="d-flex gap-2 bg-transparent">
                                    <img :src="`/storage/${radmin_profile}`" alt="" width="100" height="95"
                                        class="bg-transparent" style="border-radius: 90px;">
                                    <div class="bg-transparent mt-4">
                                        <span class="fw-light text-white bg-transparent ms-2">{{ radmin_username
                                            }}</span>
                                        <p class="fw-light text-secondary bg-transparent ms-2">admin</p>
                                    </div>
                                </div>
                                <div class="text-start bg-transparent mt-3">
                                    <a href="https://www.instagram.com/artsbyannz/" class=" bg-transparent ">
                                        <i class="bi bi-instagram bg-transparent fs-1 text-white me-3"></i>
                                    </a>
                                    <a href="https://www.facebook.com/artsbyziann" class=" bg-transparent ">
                                        <i class="bi bi-facebook bg-transparent fs-1 text-white"></i>
                                    </a>

                                </div>
                            </div>
                            <br>
                            <textarea class="form-control shadow-none bg-secondary text-white" style="height: 200px;"
                                placeholder="What's on your mind?" v-model="rcaption"></textarea>
                            <div v-if="errors.Caption" class="bg-transparent text-danger">
                                {{ errors.Caption }}
                            </div>
                            <div class="bg-transparent mt-3 w-100 position-relative"
                                v-for="(postimg, index) in rpost_images" :key="index">
                                <button @click="btnremoveimg(postimg.name)"
                                    class="btn bg-transparent text-white shadow-none position-absolute end-0 me-md-2"><i
                                        class="bi bi-x-lg bg-transparent"></i></button>
                                <p class="text-white py-3 px-md-3 ps-2 bg-secondary rounded">{{ postimg.name }}</p>
                            </div>
                            <form action="" class="mt-4 bg-transparent" @submit.prevent="btnSharePost">
                                <div class="d-flex justify-content-between bg-transparent">
                                    <div class="text-start bg-transparent">
                                        <label for="uploadPhotos" class="form-label text-white bg-transparent fs-2 mt-2"
                                            style="cursor: pointer;">
                                            <i class="bi bi-camera bg-transparent"></i>
                                        </label>
                                        <input type="file" id="uploadPhotos" hidden multiple @change="upload_images">
                                        <div v-if="errors.Postimage" class="bg-transparent text-danger">
                                            {{ errors.Postimage }}
                                        </div>
                                    </div>
                                    <div class="text-start bg-transparent mt-2">
                                        <button type="submit"
                                            class="btn btn-primary shadow-none rounded-3 px-4">Share</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue'
import { Link as inertiaLink } from '@inertiajs/vue3'
import { router } from '@inertiajs/vue3'
export default {
    name: 'cAdminNewpost',
    components: { AdminNavigation, inertiaLink },
    props: { getcAdmin_images: Object, errors: Object },
    data() {
        return {
            radmin_profile: this.getcAdmin_images ? this.getcAdmin_images.file_profile : '',
            radmin_username: this.getcAdmin_images ? this.getcAdmin_images.username : '',
            rcaption: '',
            rpost_images: []
        }
    },
    methods: {
        upload_images(event) {
            this.rpost_images = Array.from(event.target.files);
        },
        btnSharePost() {
            const data = {
                Postimage: this.rpost_images,
                Caption: this.rcaption
            }
            router.post('/storePost', data);
        },
        btnremoveimg(filename) {
            this.rpost_images = this.rpost_images.filter(image => image.name !== filename);
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
