<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navigation :userCarts="userCarts"/>
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h1 class="fw-light text-white">PREMADE BOOK COVERS</h1>
                        </div>
                        <div class="col-xl-4 col-md-6 ">
                            <div class="text-center mt-5">
                                <inertiaLink href="/affordablepremade" class="text-decoration-none">
                                    <img :src="`/storage/${get1affordable_img}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3 text-xl-start ps-xl-5" style="font-size: 14px;">
                                        AFFORDABLE PREMADE BOOK COVERS
                                    </h6>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 ">
                            <div class="text-center mt-5">
                                <inertiaLink href="/uniquepremade" class="text-decoration-none">
                                    <img :src="`/storage/${get1premadebookcover_img}`" class="rounded-3" alt=""
                                        width="350" height="410">
                                    <h6 class="fw-light text-white mt-3 text-xl-start ps-xl-5" style="font-size: 14px;">
                                        PREMADE BOOK COVERS
                                    </h6>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 ">
                            <div class="text-center mt-5">
                                <inertiaLink href="/romancepremade" class="text-decoration-none">
                                    <img :src="`/storage/${get1romance_img}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3 text-xl-start ps-xl-5" style="font-size: 14px;">
                                        ROMANCE PREMADE COVERS
                                    </h6>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">LATEST PRODUCTS</h1>
                            </div>
                            <div class="text-center">
                                <inertiaLink href="/allproducts" class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">View all</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getLatest, index) in get_latestitems" :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getLatest.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getLatest.file_image}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getLatest.title }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getLatest.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getLatest.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">UNIQUE BOOK COVERS</h1>
                            </div>
                            <div class="text-center">
                                <inertiaLink href="/uniquepremade" class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">View all</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getUnique, index) in get1_premadebookCovers"
                            :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getUnique.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getUnique.file_image}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getUnique.title }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getUnique.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getUnique.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec3">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h2 class="fw-light text-white">Join on A Magical Art Journey</h2>
                            <span class="fw-light text-white">Subscribe to my monthly newsletter, A Magical Art Journey
                                and receive art updates, early access to new arts and more bookish art journals!</span>
                            <form action="" class="d-flex justify-content-center align-items-center mt-3">
                                <div class="input-group " style="width: 500px;">
                                    <input type="text"
                                        class="form-control shadow-none bg-secondary border-dark px-3 text-white rounded-3"
                                        placeholder="Email Address">
                                    <button class="btn shadow-none ms-2 rounded-3 text-white"
                                        style="background-color: #B38ED1;">Subscribe</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
                <section id="sec4">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">AFFORDABLE BOOK COVERS</h1>
                            </div>
                            <div class="text-center">
                                <inertiaLink href="/affordablepremade" class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">View all</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getaffordable, index) in get1_affordablepremades"
                            :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getaffordable.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getaffordable.file_image}`" class="rounded-3" alt=""
                                        width="350" height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getaffordable.title
                                        }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getaffordable.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getaffordable.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec5">
                    <div class="row justify-content-center">
                        <div class="text-center">
                            <h1 class="fw-light text-white">BECOME A MEMBER</h1>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="text-center">
                                <div class="card mt-3 w-100 py-4 px-2 bg-transparent border border-white">
                                    <div class="card-body">
                                        <h6 class="card-title fw-light text-white">ARTS FRIENDS</h6>
                                        <h4 class="card-text fw-semibold text-white">FREE</h4>
                                        <a href="#">
                                            <button class="btn shadow-none text-white rounded-5 w-100 mt-3"
                                                style="background-color: #B38ED1;">Join now</button>
                                        </a>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec6">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">DIGITAL ART WALLPAPERS</h1>
                            </div>
                            <div class="text-center">
                                <inertiaLink href="/premadewallpapers" class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">View all</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getWallpaper, index) in get_PremadeWallpapers"
                            :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getWallpaper.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getWallpaper.file_image}`" class="rounded-3" alt=""
                                        width="350" height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getWallpaper.title
                                        }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getWallpaper.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getWallpaper.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec7">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">ALL PREMADE BOOK COVERS</h1>
                            </div>
                            <div class="text-center">
                                <inertiaLink href="/premadecovers" class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">View all</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getlastItem, index) in get_lastItems" :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getlastItem.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getlastItem.file_image}`" class="rounded-3" alt=""
                                        width="350" height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getlastItem.title
                                        }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getlastItem.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getlastItem.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec8">
                    <div class="row justify-content-center">
                        <div class="col-md-5">
                            <div class="text-md-start text-center mt-lg-5">
                                <h2 class="fw-light text-white">THANK YOU FOR YOUR SUPPORT!</h2>
                                <p class="fw-light text-white">Thank you so much for your support. Leave a message with
                                    your donation and I'll try to reply!</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="text-start">
                                <form @submit.prevent="btnDonation"
                                    class="d-flex flex-column justify-content-center align-items-center px-lg-5">
                                    <div class="position-relative w-100">
                                        <i class="bi bi-person-fill text-dark bg-transparent fs-3"
                                            style="position: absolute; top: 9px; left: 15px;"></i>
                                        <input type="text"
                                            class="form-control shadow-none bg-secondary border-dark text-white px-5 py-3 rounded-4"
                                            placeholder="Your name" v-model="rname">
                                    </div>
                                    <div class="mt-3 w-100 position-relative">
                                        <i class="bi bi-chat-left-dots-fill fs-3 text-dark bg-transparent"
                                            style="position: absolute; top: 13px; left: 15px;"></i>
                                        <textarea
                                            class="form-control shadow-none bg-secondary border-dark text-white px-5 py-3 rounded-4"
                                            id="floatingTextarea2" style="height: 100px;"
                                            placeholder="Message" v-model="rmessage"></textarea>
                                    </div>
                                    <button type="submit" class="btn px-5 py-2 rounded-4 w-100 mt-3 text-white" style="background-color: #B38ED1;">Donate & Mesage</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec9">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="text-center">
                                <h2 class="fw-light text-white">STAY CONNECTED</h2>
                                <br>
                                <div class="position-relative">
                                    <i class="bi bi-heart text-white bg-transparent fs-4"
                                        style="position: absolute; top: 13px; left: 20px;"></i>
                                    <a href="https://www.artsbyannz.com/">
                                        <button class="btn shadow-none w-100 fw-bold text-white rounded-5 py-3 fs-6" style="background-color: #B38ED1;">Website</button>
                                    </a>
                                </div>
                                <div class="position-relative mt-3">
                                    <i class="bi bi-question-circle text-white bg-transparent fs-4"
                                        style="position: absolute; top: 13px; left: 20px;"></i>
                                    <a href="https://www.artsbyannz.com/commission-info">
                                        <button class="btn shadow-none w-100 fw-bold text-white rounded-5 py-3 fs-6" style="background-color: #B38ED1;">Commission</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec10">
                    <div class="row justify-content-center">
                        <div class="d-lg-flex justify-content-between px-lg-5">
                            <div class="text-center">
                                <h1 class="fw-light text-white">LATEST ON INSTAGRAM</h1>
                            </div>
                            <div class="text-center">
                                <a href="https://www.instagram.com/artsbyannz" target="_blank"
                                    class="text-decoration-none">
                                    <button class="btn btn-outline-secondary rounded-5 py-2 px-4">Visit Profile</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="https://www.instagram.com/p/DE08hBJh_jr/" target="_blank">
                                    <img src="./assets/img1.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="https://www.instagram.com/reel/DEn5BP-z9gd/" target="_blank">
                                    <img src="./assets/img2.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="https://www.instagram.com/p/DEvrkexzJ5e/" target="_blank">
                                    <img src="./assets/img3.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="#">
                                    <img src="./assets/img2.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="#">
                                    <img src="./assets/img3.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-3 mt-4">
                            <div class="text-center">
                                <a href="https://www.instagram.com/p/DEYjPsGyNM_/?img_index=1" target="_blank">
                                    <img src="./assets/089ewaesd02asdfasd.jpg" alt="" class="w-75 rounded">
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <footervue />
        </div>
    </div>
</template>

<script>
import Navigation from '../Navbar/Navigation.vue';
import footervue from '../Footer/footer.vue';
import { Link as inertiaLink } from '@inertiajs/vue3'
import {router} from '@inertiajs/vue3'
export default {
    name: 'cIndex',
    components: { Navigation, footervue, inertiaLink },
    props: { get1_romancePremades: Object, get1_premadebookCovers: Object, get1_affordablepremades: Object, get_latestitems: Object, get_PremadeWallpapers: Object, get_lastItems: Object, userCarts:Object, },
    data() {
        return {
            get1affordable_img: this.get1_affordablepremades ? this.get1_affordablepremades[0].file_image : '',
            get1premadebookcover_img: this.get1_premadebookCovers ? this.get1_premadebookCovers[0].file_image : '',
            get1romance_img: this.get1_romancePremades ? this.get1_romancePremades[0].file_image : '',
            rname: '',
            rmessage: ''
        }
    },
    methods:{
        btnDonation(){
            const data = {
                name: this.rname,
                message: this.rmessage
            }
            router.get('/donation', data);
        }
    }

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(40px + 1rem) 0;
}

img:hover {
    opacity: 50%;
    transition: 0.5s;
}

</style>
