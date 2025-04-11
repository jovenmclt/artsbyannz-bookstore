<template>
    <cMembershipDashboard :userIds="userId" :userInfos="userInfo" :premadePosts="getall_premadepost" :totalLikes="getall_likes" :getall_comments="getall_comments" :userCarts="userCart"/>
</template>

<script>
import cMembershipDashboard from '../Components/MembershipDashboard/cMembershipDashboard.vue';
export default {
    name: 'MembershipDashboard',
    components: {cMembershipDashboard},
    props: {userId:Number, userInfo:Object, getall_premadepost:Array, getall_likes:Array, getall_comments:Array, userCart: Object }
}
</script>

<style>

</style>
