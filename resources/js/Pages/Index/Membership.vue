<template>
    <cMembershipVue :userCarts="userCart" :errors="errors" :userIds="userId"/>
</template>

<script>
import cMembershipVue from '../Components/Membership/cMembership.vue'
export default {
    name: 'Membership',
    components: {cMembershipVue},
    props: {errors:Object, userId:Number, userCart: Object}
}
</script>

<style>

</style>
