<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userIds="userIds" :userInfos="userInfos" :userCarts="userCarts" />
            <main class="col-xl-10 col-lg-8 col-md-12 ms-auto justify-content-center px-3 mt-5">
                <section id="section1">
                    <div class="row justify-content-center">
                        <div class="col-xl-9 col-md-10">
                            <div class="d-flex flex-column justify-content-between py-4 px-3 border border-secondary rounded w-auto" style="height: 500px; max-height: 100%;">
                                <div class="text-start">
                                    <img src="./assets/logo.png" alt="" width="150">
                                </div>
                                <div style="width: 100%; max-height: 75%; overflow: auto; scrollbar-width: none;">
                                    <div v-for="(getmessage, index) in messageConvos" :key="index" >
                                        <div v-if="getmessage.sender_id == userIds" class=" mt-2 " >
                                            <div class="d-flex justify-content-end">
                                                <p class="fw-semibold text-white rounded-3 bg-dark py-2 px-3 me-2 mb-2 d-inline-block lh-lg" style="max-width: 50%; font-size: 12px;">{{ getmessage.message }}</p>
                                            </div>
                                            <p class="fw-light text-end text-secondary me-4" style="font-size: 12px;">{{ new Date(getmessage.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }}</p>
                                        </div>
                                        <div v-else>
                                            <div class="d-flex justify-content-start">
                                                <img :src="`/storage/${adminProfile.file_profile}`" class="rounded-5 mt-2" alt="" width="35" height="35">
                                                <p class="fw-semibold text-white rounded-3 bg-secondary ms-2 py-2 px-3 mb-2 d-inline-block lh-lg" style="max-width: 50%; font-size: 12px;">{{ getmessage.message }}</p>
                                            </div>
                                            <p class="fw-light text-secondary ms-5" style="font-size: 12px;">{{ new Date(getmessage.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }}
                                            </p>

                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2">
                                    <textarea id="message" v-model="rmessage" class="form-control shadow-none rounded-5" placeholder="Leave a message here" style="max-height: 40px;"></textarea>
                                    <button @click="sendMessage" class="btn btn-secondary rounded-5">Send</button>
                                </div>
                            </div>
                            <br>
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
    name: 'cMemberMessage',
    components: { Navbar, inertiaLink },
    props: { userIds: Number, userInfos: Object, userCarts:Object, messageConvos:Array, adminProfile:Object},
    data(){
        return{
            rmessage: ''
        }
    },
    methods:{
        sendMessage(){
            const data = {
                memberMessage: this.rmessage
            }
            if(this.rmessage != ''){
                router.post('/sendmessage', data);
            }else{
                document.getElementById('message').focus();
            }
            this.rmessage = ''
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
    overflow-wrap: break-word;
}
</style>
