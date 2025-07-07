<template>
    <div class="container-xxl">
        <div class="row">
            <cadminNav :propsAdmin_images="getcAdmin_images"/>
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3">
                <section id="sec1">
                    <div class="row justify-content-end">
                        <div class="text-start py-4">
                            <inertiaLink href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Book shop > create</span>
                            </inertiaLink>
                            <h2 class="fw-semibold text-white py-3">
                                Create Premade Item
                            </h2>
                        </div>
                        <div class="col-xl-8 mt-xl-0 mt-2">
                            <div class="py-4 rounded-3 bg-dark">
                                <div class="text-start border-secondary border-bottom px-3 bg-transparent">
                                    <h5 class="fw-semibold text-white bg-transparent">
                                        Item Information
                                    </h5>
                                </div>
                                <form @submit.prevent="createPremadeItem" class="px-3 bg-transparent mt-4">
                                    <div class="d-md-flex gap-2 bg-transparent">
                                        <div class="bg-transparent w-100">
                                            <p class="fw-light text-white bg-transparent">
                                                Upload File <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <input
                                                class="form-control bg-secondary text-white border-secondary shadow-none rounded-2"
                                                type="file" @change="handleFileUpload" />

                                            <div v-if="errors.File_Image" class="bg-transparent text-danger">
                                                {{ errors.File_Image }}
                                            </div>
                                        </div>
                                        <div class="bg-transparent w-100 mt-md-0 mt-2">
                                            <p class="fw-light text-white bg-transparent">
                                                Premade Title <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <input type="text"
                                                class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white"
                                                v-model="title" />
                                            <div v-if="errors.Title" class="bg-transparent text-danger">
                                                {{ errors.Title }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-md-flex gap-2 bg-transparent mt-xl-4 mt-3">
                                        <div class="bg-transparent w-100 mt-md-0 mt-2">
                                            <p class="fw-light text-white bg-transparent">
                                                Original Price <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <input type="text"
                                                class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white"
                                                v-model="original_price" />
                                            <div v-if="errors.Original_Price" class="bg-transparent text-danger">
                                                {{ errors.Original_Price }}
                                            </div>
                                        </div>
                                        <div class="bg-transparent w-100 mt-md-0 mt-2">
                                            <p class="fw-light text-white bg-transparent">
                                                Discount Price / Optional <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <input type="text"
                                                class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white"
                                                v-model="discount_price" />
                                            <div v-if="errors.Discount_Price" class="bg-transparent text-danger">
                                                {{ errors.Discount_Price }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-md-flex gap-2 bg-transparent mt-xl-4 mt-3">
                                        <div class="bg-transparent w-100">
                                            <p class="fw-light text-white bg-transparent">
                                                Type <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <select
                                                class="form-select bg-secondary text-white border-secondary shadow-none rounded-2"
                                                v-model="type">
                                                <option selected></option>
                                                <option value="Book Cover" class="text-white">
                                                    Premade Book Cover
                                                </option>
                                                <option value="WallPaper" class="text-white">
                                                    Premade WallPaper
                                                </option>
                                            </select>
                                            <div v-if="errors.Type" class="bg-transparent text-danger">
                                                {{ errors.Type }}
                                            </div>
                                        </div>
                                        <div class="bg-transparent w-100 mt-md-0 mt-2">
                                            <p class="fw-light text-white bg-transparent">
                                                Class / Optional <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <select
                                                class="form-select bg-secondary text-white border-secondary shadow-none rounded-2"
                                                v-model="item_class">
                                                <option selected></option>
                                                <option value="ROMANCE PREMADE COVERS" class="text-white">
                                                    Romance Book Cover
                                                </option>
                                                <option value="UNIQUE BOOK COVERS" class="text-white">
                                                    Unique Book Cover
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="bg-transparent mt-xl-4 mt-3">
                                        <div class="bg-transparent w-100 mt-md-0 mt-2">
                                            <p class="fw-light text-white bg-transparent">
                                                Description <span class="text-danger bg-transparent">*</span>
                                            </p>
                                            <textarea
                                                class="form-control bg-secondary border-secondary shadow-none rounded-2 text-white"
                                                style="height: 150px" v-model="description"></textarea>
                                            <div v-if="errors.Description" class="bg-transparent text-danger">
                                                {{ errors.Description }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="py-4 rounded-3 bg-transparent d-xl-none d-block">
                                        <div class="text-start border-secondary border-bottom px-3 bg-transparent">
                                            <h5 class="fw-semibold text-white bg-transparent">
                                                Status
                                            </h5>
                                        </div>
                                        <div class="text-start px-3 pt-3 bg-transparent">
                                            <div class="form-check form-switch bg-transparent mb-1">
                                                <input class="form-check-input shadow-none" type="checkbox" id="stats"
                                                    checked v-model="status" />
                                                <label class="form-check-label bg-transparent text-white" for="stats">
                                                    Available</label>
                                            </div>
                                            <span class="fw-light text-secondary bg-transparent">This premade item will
                                                be
                                                visible on
                                                the site, and users can purchase.</span>
                                        </div>
                                    </div>
                                    <div class="text-start mt-3 bg-transparent">
                                        <button type="submit" class="btn btn-primary me-2">
                                            Create
                                        </button>
                                        <inertiaLink href="/admin/bookshop" class="text-decoration-none bg-transparent">
                                            <button class="btn btn-transparent btn-outline-secondary">
                                                Cancel
                                            </button>
                                        </inertiaLink>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="py-4 rounded-3 d-none d-xl-block bg-dark" >
                                <div class="text-start border-secondary border-bottom px-3 bg-transparent">
                                    <h5 class="fw-semibold text-white bg-transparent">
                                        Status
                                    </h5>
                                </div>
                                <div class="text-start px-3 pt-3 bg-transparent">
                                    <div class="form-check form-switch bg-transparent mb-1">
                                        <input class="form-check-input shadow-none" type="checkbox" id="stats" checked
                                            v-model="status" style="cursor: pointer;" />
                                        <label class="form-check-label bg-transparent text-white" for="stats">
                                            Available</label>
                                    </div>
                                    <span class="fw-light text-secondary bg-transparent">This premade item will be
                                        visible on
                                        the site, and users can purchase.</span>
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
import cadminNav from "../AdminNavbar/AdminNavigation.vue";
import { Link as inertiaLink } from "@inertiajs/vue3";
import { router } from "@inertiajs/vue3";
export default {
    name: "cAdminAdditem",
    components: { cadminNav, inertiaLink },
    props: { errors: Object, getcAdmin_images:Object },
    data() {
        return {
            rstats: false,
            file_image: null,
            title: "",
            original_price: "",
            discount_price: "",
            type: "",
            item_class: "",
            description: "",
            status: true,
        };
    },
    methods: {
        handleFileUpload(event) {
            this.file_image = event.target.files[0];
        },
        createPremadeItem() {
            const data = {
                File_Image: this.file_image,
                Title: this.title,
                Original_Price: this.original_price,
                Discount_Price: this.discount_price,
                Type: this.type,
                Item_Class: this.item_class,
                Description: this.description,
                Status: this.status,
            };
            router.post("/storeItem", data);
        },
    },
};
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
