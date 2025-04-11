<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userIds="userIds" :userInfos="userInfos" :userCarts="userCarts" />
            <main class="col-xl-9 col-lg-8 col-md-12 ms-auto justify-content-center px-3 mt-5">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="text-start">
                                <h2 class="fw-semibold text-white">PROFILE SETTINGS</h2>
                                <inertiaLink href="/memberBilling" class="fw-light text-secondary"> Billing History</inertiaLink>
                                <form class="mt-2" @submit.prevent="btnSaveChanges">
                                    <div class="d-flex py-4">
                                        <div v-if="userInfos.file_profile">
                                            <img :src="`/storage/${rfile_profile}`" alt="" style="border-radius: 50px;" width="100" height="100">
                                        </div>
                                        <br><br>
                                        <div class="mb-4" v-if="!userInfos.file_profile">
                                            <i class="bi bi-person fs-1 text-white bg-secondary px-4 py-3 rounded-5 "></i>
                                        </div>
                                        <input class="form-control bg-secondary text-white border-secondary shadow-none rounded-2 h-25 w-50 mt-4 ms-3" type="file" @change="uploadProfile" />
                                    </div>

                                    <p class="fw-light text-white bg-transparent">
                                        Full Name <span class="text-danger bg-transparent">*</span>
                                    </p>
                                    <input type="text"
                                        class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white w-75"
                                        v-model="rfullname" />

                                    <p class="fw-light text-white bg-transparent mt-4">
                                        Username <span class="text-danger bg-transparent">*</span>
                                    </p>
                                    <input type="text"
                                        class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white w-75"
                                        v-model="rusername" />
                                    <p class="fw-light text-secondary mt-2">Visible to the creator and community.</p>

                                    <p class="fw-light text-white bg-transparent">
                                        Email <span class="text-danger bg-transparent">*</span>
                                    </p>
                                    <input type="text"
                                        class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white w-75"
                                        v-model="remail" />

                                    <p class="fw-light text-white mt-4">
                                        Password <span class="text-danger bg-transparent">*</span>
                                    </p>
                                    <input type="password"
                                        class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white w-75"
                                        v-model="rpassword" />
                                    <p class="fw-light text-secondary mt-2">You have never changed your password.</p>

                                    <button type="submit"
                                        class="btn shadow-none px-3 py-2 rounded-5 text-white fw-semibold"
                                        style="background-color: #B38ED1;"> Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import Navbar from '../MembershipNavbar/MembershipNav.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
import { router } from '@inertiajs/vue3'
export default {
    name: 'cMemberProfile',
    components: { Navbar, inertiaLink },
    props: { userIds: Number, userInfos: Object, userCarts:Object },
    data() {
        return {
            rfullname: this.userInfos ? this.userInfos.fullname : '',
            remail: this.userInfos ? this.userInfos.email : '',
            rusername: this.userInfos ? this.userInfos.username : '',
            rpassword: '',
            rfile_profile: this.userInfos ? this.userInfos.file_profile : '',
            newfile_profile: null,
            rid: this.userIds
        }
    },
    methods: {
        uploadProfile(event) {
            this.newfile_profile = event.target.files[0];
        },
        btnSaveChanges() {
            const data = {
                Fullname: this.rfullname,
                Email: this.remail,
                Username: this.rusername,
                Password: this.rpassword,
                Profile: this.newfile_profile
            }
            router.post(`/updatememberprofile/${this.rid}`, data);
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}
</style>
