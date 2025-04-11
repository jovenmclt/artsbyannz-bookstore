<template>
    <cAdminViewallPost :adminImages="getAdminImage" :premadePosts="getall_premadepost" :totalLikes="getall_likes" :getall_comments="getall_comments" :userId="get_authID" :userInfo="getuser_info"/>
</template>

<script>
import cAdminViewallPost from '../Components/AdminViewallPost/cAdminViewallPost.vue';
export default {
    name: 'AdminViewallPost',
    components:{cAdminViewallPost},
    props: {getAdminImage:Object, getall_premadepost:Array, getall_likes:Array, getall_comments:Array, get_authID:Number, getuser_info:Object,}
}
</script>

<style>

</style>
