<template>
    <cAdminEditpost :getcAdmin_images="getAdminImage" :errors="errors" :PremadePosts="PremadePost"/>
</template>

<script>
import cAdminEditpost from '../Components/AdminEditPost/cAdminEditpost.vue';
export default {
    name: 'AdminEditpost',
    components: {cAdminEditpost},
    props:{getAdminImage:Object, errors:Object, PremadePost: Object}
}
</script>

<style>

</style>
