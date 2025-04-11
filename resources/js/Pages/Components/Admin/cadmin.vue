<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <main class="col-12">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="col-xl-4">
                            <div class="shadow-sm shadow py-4 px-4 mt-5 rounded-4" style="background-color: #2a3335">
                                <div class="text-start bg-transparent">
                                    <h3 class="fw-bold text-white me-xl-3 bg-transparent text-center"> <i
                                            class="bi bi-lock-fill fs-4 bg-transparent"></i>artsbyannz</h3>
                                    <h5 class="fw-bold text-white bg-transparent text-center">Sign in</h5>

                                    <br>
                                    <form @submit.prevent="btnLogin" class="bg-transparent ">
                                        <label for="username" class="form-label bg-transparent text-white">Username <span class="bg-transparent text-danger">*</span></label>
                                        <input type="text" class="form-control shadow-none bg-secondary border-secondary text-white"
                                            v-model="rusername" id="username">
                                        <label for="username" class="form-label bg-transparent text-white mt-3">Password <span class="bg-transparent text-danger">*</span></label>
                                        <input type="password"  class="form-control shadow-none bg-secondary border-secondary text-white"
                                            v-model="rpassword">
                                        <div v-if="flash_failedAuth" class=" bg-transparent text-center mt-2">
                                            <p class="fw-semibold text-danger mb-0  bg-transparent">{{ flash_failedAuth }}</p>
                                        </div>
                                        <br>
                                        <input type="checkbox" class="bg-secondary mb-4">
                                        <span class="text-white bg-transparent"> Remember me</span>
                                        <div class="text-center bg-transparent">
                                            <button type="submit" class="btn btn-primary px-4 w-100">
                                                <span class="fw-bold  bg-transparent">Sign in</span>
                                            </button>
                                        </div>
                                        <br>
                                    </form>
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
import { router } from '@inertiajs/vue3'
export default {
    props:{ flash_failedAuth:String},
    data() {
        return {
            rusername: '',
            rpassword: ''
        }
    },
    methods: {
        btnLogin() {
            const data = {
                username: this.rusername,
                password: this.rpassword
            }
            router.post('/loginStore', data)
        }
    }
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");

#sec1 {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}

section {
    font-family: "Poppins", serif;
    padding: calc(20px + 1rem) 0;
}
</style>
