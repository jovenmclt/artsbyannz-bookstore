<template>
    <cAdminCustomer :getcAdmin_images="getAdminImage" :get_recentCutomers="get_recentCutomer"/>
</template>

<script>
import cAdminCustomer from '../Components/AdminCustomer/cAdminCustomer.vue';
export default {
    name: 'AdminCustomer',
    components:{cAdminCustomer},
    props:{ getAdminImage:Object, get_recentCutomer:Array}
}
</script>

<style>

</style>
