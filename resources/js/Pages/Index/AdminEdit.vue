<template>
    <cAdminEdit :premadeItem="premadeItems" :errors="errors" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminEdit from '../Components/AdminEdit/cAdminEdit.vue';
export default {
    name: 'AdminEdit',
    components: {cAdminEdit},
    props: {premadeItems:Object, errors:Object,  getAdminImage:Object},
}
</script>

<style>

</style>
