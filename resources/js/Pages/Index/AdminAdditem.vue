<template>
    <cAdminAdditemVue :errors="errors" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminAdditemVue from '../Components/AdminAddItems/cAdminAdditem.vue'

export default {
    name: 'cAdminAdditem',
    components:{cAdminAdditemVue},
    props:{errors:Object, getAdminImage:Object}
}
</script>

<style>

</style>
