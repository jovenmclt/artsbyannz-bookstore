<template>
    <cAdminViewItem :premadeItems="premadeItems" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminViewItem from '../Components/AdminViewItem/cAdminViewItem.vue';
export default {
    name: 'AdminViewItem',
    components:{cAdminViewItem},
    props: {premadeItems:Object,  getAdminImage:Object}
}
</script>

<style>

</style>
