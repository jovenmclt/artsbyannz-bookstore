<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <main class="col-12 justify-content-center align-items-center" style="margin-top: 100px;">
                <section id="sec1" class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <img :src="`/storage/${get_userLogos.file_logo}`" alt="" class="w-25">
                            <br><br>
                            <h2 class="fw-semibold text-white">Reset Password</h2>
                            <p class="fw-semibold text-danger">{{ errorMessage }}</p>
                        </div>
                        <div class="col-xl-4 col-md-5">
                            <div class="d-flex justify-content-center align-items-center flex-column">
                                <form @submit.prevent="btnResetPassword" class="bg-transparent w-100">
                                    <label for="email" class="form-label bg-transparent text-white">Email <span class="bg-transparent text-danger">*</span></label>
                                    <input type="text"  class="form-control shadow-none bg-secondary border-secondary text-white" id="email" v-model="remail" readonly>

                                    <label for="username" class="form-label bg-transparent text-white mt-3">New password <span class="bg-transparent text-danger">*</span></label>
                                    <input type="password" class="form-control shadow-none bg-secondary border-secondary text-white" v-model="rpassword" required>

                                    <label for="username" class="form-label bg-transparent text-white mt-3">Confirm password <span class="bg-transparent text-danger">*</span></label>
                                    <input type="password" class="form-control shadow-none bg-secondary border-secondary text-white" v-model="rconfirmPass" required>
                                    <br>
                                    <div class="text-center bg-transparent mt-2">
                                        <button type="submit" class="btn px-4 py-2 rounded-5 w-100"
                                            style="background-color: #B38ED1;">
                                            <span class="fw-bold  bg-transparent text-white ">Save Changes</span>
                                        </button>
                                    </div>
                                    <br>
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
import {router} from '@inertiajs/vue3'
export default {
    name: 'cMembershipReset',
    props: {email:String, token:String, get_userLogos:Object},
    data(){
        return{
            rpassword: '',
            rconfirmPass: '',
            remail: this.email,

            errorMessage: ''
        }
    },
    methods:{
        btnResetPassword(){
            const data = {
                token: this.token,
                email: this.remail,
                password: this.rpassword,
                password_confirmation: this.rconfirmPass
            }
            if(this.rpassword == this.rconfirmPass){
                router.post('/reset-password', data);
            }else{
                this.errorMessage = 'Password mismatch.'
            }

        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');


.fade-in-div{
    animation: fadein 1s ease-in-out;
}

@keyframes fadein {
  0%   {opacity: 0%;}

  100% {opacity: 100%;}
}
</style>
