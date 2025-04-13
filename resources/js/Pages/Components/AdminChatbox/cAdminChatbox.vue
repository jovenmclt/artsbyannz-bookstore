<template>
     <div class="container-xxl">
        <div class="row">
            <AdminNavigationVue :propsAdmin_images="getcAdmin_images"/>
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">message > inbox</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white "> Message Inbox</h4>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div v-for="(getuser, index) in get_usersConvoInfo" :key="index" style="max-height: 900px; overflow: auto; scrollbar-width:inherit;">
                                <inertiaLink href="#" class="text-decoration-none d-flex flex-wrap justify-content-between border rounded-2 mt-3 py-2 px-3">
                                    <div class="d-flex gap-2">
                                        <div v-if="getuser.file_profile" class="text-start">
                                            <img :src="`/storage/${getuser.file_profile}`" alt="" width="60" height="60" class="rounded-5">
                                        </div>
                                        <div v-else>
                                            <img width="60" height="60" src="https://img.icons8.com/color/100/user-male-circle--v1.png" alt="user-male-circle--v1"/>
                                        </div>
                                        <div class="text-start">
                                            <h5 class="fw-normal text-white mt-2" style="font-size: 12px;">{{ getuser.fullname }}</h5>
                                            <h6 class="fw-light text-white mt-2" style="font-size: 12px;">{{ getuser.email }}</h6>
                                        </div>
                                    </div>
                                    <div class="text-start">
                                        <p class="fw-light text-white mt-3 mb-0" style="font-size: 12px;">Account created</p>
                                        <p class="fw-light text-white" style="font-size: 12px;"> {{ new Date(getuser.created_at).toISOString().slice(0, 10) }}  </p>
                                    </div>
                                    <div v-if="isSender(getuser.id)" class="text-start">
                                        <p class="fw-semibold text-white mt-3" style="font-size: 12px;">Unread message<span class="text-danger">*</span></p>
                                    </div>
                                    <div v-else>
                                        <p class="fw-light text-white mt-3" style="font-size: 12px;">read message</p>
                                    </div>

                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigationVue from '../AdminNavbar/AdminNavigation.vue'
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'cAdminChatbox',
    components: { AdminNavigationVue, inertiaLink },
    props: {getcAdmin_images:Object, get_usersConvoInfo:Array, get_readmessage:Array},
    methods:{
        isSender(userId){
            return this.get_readmessage.some(msg => msg.sender_id == userId);
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
    padding: calc(10px + 1rem) 0;
}
</style>
