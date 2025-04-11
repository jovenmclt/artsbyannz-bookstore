<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center ">
                <section id="sec1">
                    <div class="row justify-content-start px-3">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Admin > Privacy & Settings</span>
                            </a>
                            <h4 class="fw-semibold text-white py-3 "><img width="40" height="40" src="https://img.icons8.com/fluency/48/settings.png" alt="settings"/> Privacy & Settings</h4>
                        </div>
                        <div class="col-xl-12">
                            <div class="py-4 px-lg-5 px-3 rounded-3" style="background-color: #2A3335;">
                                <div class="text-start bg-transparent">
                                    <div class="d-md-flex justify-content-between text-center bg-transparent py-3">
                                        <h5 class="fw-bold text-white bg-transparent">Account Settings</h5>
                                        <button v-if="!updateCredentials" @click="btnUpdateCred"
                                            class="btn btn-dark text-white">Update Credentials</button>
                                    </div>
                                    <span class="fw-light text-secondary bg-transparent d-none d-md-block">Welcome to
                                        your account settings
                                        page, where you can manage your administrative details. As the admin, you have
                                        the
                                        ability to securely update your username and password. Keeping your credentials
                                        updated ensures the security and smooth operation of your account</span>
                                </div>
                                <div class="text-center py-5 my-4 bg-dark rounded-4 " v-if="updateCredentials">
                                    <h5 class="fw-semibold text-white bg-transparent">Update Credentials</h5>
                                    <div
                                        class="d-flex flex-column justify-content-center align-items-center bg-transparent">
                                        <form class="bg-transparent w-75 text-start" @submit.prevent="saveCredentials">
                                            <label for="username" class="form-label bg-transparent text-white">New
                                                Username
                                                <span class="bg-transparent text-danger">*</span></label>
                                            <input type="text"
                                                class="form-control shadow-none bg-secondary border-secondary text-white"
                                                v-model="rusername" id="username">
                                            <div v-if="errors.username" class="bg-transparent text-danger">
                                                {{ errors.username }}
                                            </div>
                                            <label for="username" class="form-label bg-transparent text-white mt-3">New
                                                Password
                                                <span class="bg-transparent text-danger">*</span></label>
                                            <input type="password"
                                                class="form-control shadow-none bg-secondary border-secondary text-white"
                                                v-model="rpassword">
                                            <div v-if="errors.password" class="bg-transparent text-danger">
                                                {{ errors.password }}
                                            </div>
                                            <br>
                                            <input type="checkbox" class="bg-secondary mb-4" required
                                                v-model="checkbox">
                                            <span class="text-secondary bg-transparent"> Confirm Changes</span>
                                            <div class="text-center bg-transparent">
                                                <button type="submit" class="btn btn-primary px-4 w-100">
                                                    <span class="fw-bold  bg-transparent">Save Changes</span>
                                                </button>
                                                <button @click="CancelChanges"
                                                    class="btn btn-outline-secondary mt-3 px-4 w-100">
                                                    <span class="fw-bold  bg-transparent">Cancel</span>
                                                </button>
                                            </div>
                                            <br>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="py-4 px-lg-5 px-3 rounded-3 mt-4" style="background-color: #2A3335;">
                                <div class="text-start bg-transparent">
                                    <div class="d-md-flex justify-content-between text-center bg-transparent py-3">
                                        <h5 class="fw-bold text-white bg-transparent">Profile Settings</h5>
                                        <button v-if="!updateProfile" @click="btnUpdateprofile"
                                            class="btn btn-dark text-white">Update Profile</button>
                                    </div>
                                    <span class="fw-light text-secondary bg-transparent d-none d-md-block">To
                                        Keep your website's profile accurate and up to date with ease. Update the logo
                                        anytime to maintain a cohesive and fresh look. Ensure your website consistently
                                        represents a professional and refined image.</span>
                                </div>
                                <div class="text-center py-5 my-4 bg-dark rounded-4 " v-if="updateProfile">
                                    <h5 class="fw-semibold text-white bg-transparent">Update Profile</h5>
                                    <div
                                        class="d-flex flex-column justify-content-center align-items-center bg-transparent">
                                        <form class="bg-transparent w-75 text-start" @submit.prevent="saveProfile">
                                            <label for="username" class="form-label bg-transparent text-white">New Logo
                                                <span class="bg-transparent text-danger">*</span></label>
                                            <input
                                                class="form-control bg-secondary text-white border-secondary shadow-none rounded-2"
                                                type="file" @change="newLogo" />
                                            <div v-if="errors.username" class="bg-transparent text-danger">
                                                {{ errors.username }}
                                            </div>
                                            <label for="username" class="form-label bg-transparent text-white mt-3">New
                                                Profile
                                                <span class="bg-transparent text-danger">*</span></label>
                                            <input
                                                class="form-control bg-secondary text-white border-secondary shadow-none rounded-2"
                                                type="file" @change="newProfile" />
                                            <div v-if="errors.password" class="bg-transparent text-danger">
                                                {{ errors.password }}
                                            </div>
                                            <br>
                                            <input type="checkbox" class="bg-secondary mb-4" required
                                                v-model="checkbox2">
                                            <span class="text-secondary bg-transparent"> Confirm Changes</span>
                                            <div class="text-center bg-transparent">
                                                <button type="submit" class="btn btn-primary px-4 w-100">
                                                    <span class="fw-bold  bg-transparent">Save Changes</span>
                                                </button>
                                                <button @click="cancelChanges2" class="btn btn-outline-secondary mt-3 px-4 w-100">
                                                    <span class="fw-bold  bg-transparent">Cancel</span>
                                                </button>
                                            </div>
                                            <br>
                                        </form>
                                    </div>
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
import { router } from '@inertiajs/vue3'
export default {
    name: 'cAdminPrivacySettings',
    components: { AdminNavigation },
    props: { adminAccounts: Object, errors: Object , getcAdmin_images:Object},
    data() {
        return {
            updateCredentials: false,
            checkbox: false,
            rusername: this.adminAccounts ? this.adminAccounts.username : '',
            rpassword: '',


            updateProfile: false,
            checkbox2: false,
            imgLogo: null,
            imgProfile: null,
            rid: this.adminAccounts ? this.adminAccounts.id : '',
        }
    },
    methods: {
        btnUpdateCred() {
            this.updateCredentials = !this.updateCredentials
        },
        btnUpdateprofile() {
            this.updateProfile = !this.updateProfile
        },
        saveCredentials() {
            const data = {
                username: this.rusername,
                password: this.rpassword,
            }
            const confirmchanges = confirm("Do you really want to apply this changes?");
            if (confirmchanges) {
                router.post(`/updateCredentials/${this.rid}`, data);
                this.rpassword = ''
                this.checkbox = false
                this.updateCredentials = !this.updateCredentials
            }
        },
        CancelChanges() {
            this.rpassword = ''
            this.checkbox = false
            this.updateCredentials = !this.updateCredentials
        },
        newLogo(event) {
            this.imgLogo = event.target.files[0];
        },
        newProfile(event) {
            this.imgProfile = event.target.files[0];
        },
        saveProfile() {
            const data = {
                Logo: this.imgLogo,
                Profile: this.imgProfile,
            }
            const confirmchanges = confirm("Do you really want to apply this changes?");
            if (confirmchanges) {
                router.post(`/updateProfile/${this.rid}`, data);
                this.checkbox2 = false
                this.updateProfile = !this.updateProfile
            }
        },
        cancelChanges2() {
            this.checkbox2 = false
            this.updateProfile = !this.updateProfile
        }
    },
    mounted() {
        console.log(this.adminAccounts);
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

#sec1 {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
    overflow-wrap: break-word;
}

section {
    font-family: "Poppins", serif;
    padding: calc(10px + 1rem) 0;
    overflow-wrap: break-word;
}
</style>
