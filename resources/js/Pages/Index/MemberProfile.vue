<template>
    <cMemberProfile :userIds="userId" :userInfos="userInfo" :userCarts="userCart"/>
</template>

<script>
import cMemberProfile from '../Components/MemberProfile/cMemberProfile.vue';
export default {
    name: 'MemberProfile',
    components: {cMemberProfile},
    props: {userId:Number, userInfo:Object, userCart: Object}
}
</script>

<style>

</style>
