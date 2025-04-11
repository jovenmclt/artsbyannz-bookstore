<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <mainNav :userCarts="userCarts" />
            <main class="col-12 justify-content-center align-items-center" style="margin-top: 100px;">
                <section id="sec1" v-if="!showToggle">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h2 class="fw-semibold text-white">LOGIN</h2>
                        </div>
                        <div class="col-xl-4 col-md-5">
                            <div class="d-flex justify-content-center align-items-center flex-column">
                                <form @submit.prevent="btnMemberLogin" class="bg-transparent w-100">
                                    <label for="username" class="form-label bg-transparent text-white">Username <span
                                            class="bg-transparent text-danger">*</span></label>
                                    <input type="text"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="rusername" id="username" required>
                                    <label for="username" class="form-label bg-transparent text-white mt-3">Password
                                        <span class="bg-transparent text-danger">*</span></label>
                                    <input type="password"
                                        class="form-control shadow-none bg-secondary border-secondary text-white"
                                        v-model="rpassword" required>
                                    <div v-if="flash_failedAuth" class="text-center mt-2">
                                        <p class="fw-semibold text-danger mb-0">{{ flash_failedAuth }}</p>
                                    </div>
                                    <br>
                                    <div class="text-center bg-transparent mt-2">
                                        <button type="submit" class="btn px-4 py-2 rounded-5 w-100"
                                            style="background-color: #B38ED1;">
                                            <span class="fw-bold  bg-transparent text-white ">Login</span>
                                        </button>
                                    </div>
                                    <br>
                                </form>
                                <div class="text-center">
                                    <a href="#" @click="btnshowToggle" class="fw-light text-white">Forgot password?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2" v-if="showToggle">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h2 class="fw-semibold text-white">FORGOT PASSWORD</h2>
                            <div v-if="flash_successStats">
                                <p class="fw-semibold text-info">{{ flash_successStats}}</p>
                            </div>
                            <div v-else-if="flash_failedStats">
                                <p class="fw-semibold text-danger">{{ flash_failedStats}}</p>
                            </div>
                            <div v-else>
                                <p class="fw-light text-white">Enter your email address to reset your password</p>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-5">
                            <div class="d-flex justify-content-center align-items-center flex-column">
                                <form @submit.prevent="sendEmail" class="bg-transparent w-100">
                                    <label for="email" class="form-label bg-transparent text-white">Email <span class="bg-transparent text-danger">*</span></label>
                                    <input type="text"  class="form-control shadow-none bg-secondary border-secondary text-white" id="email" v-model="remail" required>
                                    <br>
                                    <div class="text-center bg-transparent mt-2">
                                        <button type="submit" class="btn px-4 py-2 rounded-5 w-100"
                                            style="background-color: #B38ED1;">
                                            <span class="fw-bold  bg-transparent text-white ">Reset password</span>
                                        </button>
                                    </div>
                                    <br>
                                </form>
                                <div class="text-center">
                                    <a href="#" @click="btnshowToggle" class="fw-light text-white">Back to login</a>
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
import mainNav from '../Navbar/Navigation.vue';
import {router} from '@inertiajs/vue3'
export default {
    name: 'cMembershipLogin',
    components: { mainNav },
    props:{userCarts:Object, flash_successStats:String, flash_failedStats:String, flash_failedAuth:String},
    data(){
        return{
            rusername: '',
            rpassword: '',
            showToggle: false,
            remail: '',
        }
    },
    methods: {
        btnshowToggle(){
            this.showToggle = !this.showToggle
        },
        sendEmail(){
            const data = {
                email: this.remail
            }
            router.post('/forgot-password', data)
        },
        btnMemberLogin(){
            const data = {
                username: this.rusername,
                password: this.rpassword
            }
            router.post('/loginStore', data);
        }
    },

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

</style>
