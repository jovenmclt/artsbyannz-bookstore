<template>
    <cAdminNewpost :getcAdmin_images="getAdminImage" :errors="errors"/>
</template>

<script>
import cAdminNewpost from '../Components/AdminNewpost/cAdminNewpost.vue';
export default {
    name: 'AdminNewpost',
    components: {cAdminNewpost},
    props: {errors:Object, getAdminImage:Object}
}
</script>

<style>

</style>
