<template>
    <cAdminMembershipdash :getcAdmin_images="getAdminImage" :getall_posts="getall_post" :getall_users="getall_user"/>
</template>

<script>
import cAdminMembershipdash from '../Components/AdminPremadePost/cAdminMembershipdash.vue';
export default {
    name: 'AdminPremadePost',
    components: {cAdminMembershipdash},
    props: {getAdminImage:Object, getall_post:Array, getall_user:Object}
}
</script>

<style>

</style>
