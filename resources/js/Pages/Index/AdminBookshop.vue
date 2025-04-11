<template>
  <cAdminBookshopVue :premade_item="premade_items" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminBookshopVue from '../Components/AdminBookshop/cAdminBookshop.vue'
export default {
    name: 'AdminBookshop',
    components:{cAdminBookshopVue},
    props:{premade_items:Array, getAdminImage:Object}
}
</script>

<style>

</style>
