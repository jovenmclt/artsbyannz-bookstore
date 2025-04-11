<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userCarts="userCarts"/>
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1" v-if="!showjoin">
                    <div class="row justify-content-center">
                        <div class="text-center px-2">
                            <p class="fw-light text-white">Support me and my art journey and get exclusive content and
                                access to my works for FREE!</p>
                        </div>
                        <div class="col-xl-5 col-md-8 mt-5">
                            <div class="text-center">
                                <h2 class="fw-light text-white">WANT MORE OF MY ARTS?</h2>
                                <div class="card mt-3 w-100 py-4 px-2 bg-transparent border border-white">
                                    <div class="card-body">
                                        <h6 class="card-title fw-light text-white">ARTS FRIENDS</h6>
                                        <h4 class="card-text fw-semibold text-white">FREE</h4>
                                        <button @click="btnShowjoin"
                                            class="btn shadow-none text-white rounded-5 w-100 mt-3"
                                            style="background-color: #B38ED1;">Join now</button>
                                        <p class="card-text text-white text-start mt-3" style="font-size: 15px;">Get
                                            early access to premade book covers, behind the scene and creation process
                                            of my artworks!</p>
                                        <h6 class="card-text text-white text-start mt-3"><i class="bi bi-check2"></i>
                                            Behind-the-scene art process</h6>
                                        <h6 class="card-text text-white text-start mt-3"><i class="bi bi-check2"></i> A
                                            Journal of Magic Newsletter</h6>
                                        <h6 class="card-text text-white text-start mt-3"><i class="bi bi-check2"></i>
                                            Early access to premades & art products</h6>
                                        <h6 class="card-text text-white text-start mt-3"><i class="bi bi-check2"></i>
                                            Art Updates</h6>
                                        <div v-if="!userIds">
                                            <p class="card-text fw-light text-white text-start mt-4">Have an account already? <b>
                                                <inertiaLink href="/loginmember" class="text-white">Login</inertiaLink>
                                           </b></p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2" v-if="showjoin">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h2 class="fw-light text-white">CREATE ACCOUNT</h2>
                            <p class="fw-light text-white">Have an account already? <b>
                                    <inertiaLink href="/loginmember" class="text-white">Login</inertiaLink>
                                </b></p>
                        </div>
                        <div class="col-xl-5 col-md-8 ">
                            <div class="d-flex justify-content-center align-items-center flex-column">
                                <form @submit.prevent="createAccount" class="bg-transparent w-100">
                                    <label for="username" class="form-label bg-transparent text-white">Full Name<span
                                            class="bg-transparent text-danger">*</span></label>
                                    <input type="text"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="rfullname" >
                                    <div v-if="errors.Fullname" class="bg-transparent text-danger">
                                        {{ errors.Fullname }}
                                    </div>
                                    <label for="username" class="form-label bg-transparent text-white mt-3">Email
                                        <span class="bg-transparent text-danger">*</span></label>
                                    <input type="text"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="remail">
                                    <div v-if="errors.Email" class="bg-transparent text-danger">
                                        {{ errors.Email }}
                                    </div>
                                    <br>
                                    <label for="username" class="form-label bg-transparent text-white">Username <span
                                            class="bg-transparent text-danger">*</span></label>
                                    <input type="text"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="rusername" >
                                    <div v-if="errors.Username" class="bg-transparent text-danger">
                                        {{ errors.Username }}
                                    </div>
                                    <label for="username" class="form-label bg-transparent text-white mt-3">Password
                                        <span class="bg-transparent text-danger">*</span></label>
                                    <input type="password"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="rpassword">
                                    <div v-if="errors.Password" class="bg-transparent text-danger">
                                        {{ errors.Password }}
                                    </div>
                                    <br>
                                    <div class="text-center bg-transparent mt-2">
                                        <button type="submit" class="btn px-4 py-2 rounded-5 w-100"
                                            style="background-color: #B38ED1;">
                                            <span class="fw-bold  bg-transparent text-white ">Join for free</span>
                                        </button>
                                    </div>
                                    <br>
                                </form>
                                <div class="text-center">
                                    <p class="fw-light text-white">By signing up you agree to <b><a href="#"
                                                class="text-white">Terms of Privacy</a></b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div v-if="!showjoin">
                    <footerVue />
                </div>
            </main>
        </div>
    </div>
</template>

<script>
import Navbar from '../Navbar/Navigation.vue'
import footerVue from '../Footer/footer.vue'
import { router } from '@inertiajs/vue3'
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'cMembership',
    components: { Navbar, footerVue, inertiaLink },
    props: { errors: Object, userIds:Number, userCarts:Object },
    data() {
        return {
            showjoin: false,
            rfullname: '',
            remail: '',
            rusername: '',
            rpassword: ''
        }
    },
    methods: {
        btnShowjoin() {
            if(this.userIds){
                router.visit('/membershipdashboard');
            }else{
                this.showjoin = !this.showjoin
            }
        },
        createAccount() {
            const data = {
                Fullname: this.rfullname,
                Email: this.remail,
                Username: this.rusername,
                Password: this.rpassword
            }
            router.post('/registerStore', data);
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
