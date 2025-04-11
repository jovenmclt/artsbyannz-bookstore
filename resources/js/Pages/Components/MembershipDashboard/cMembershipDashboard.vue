<template>
    <div class="container-xxl">
        <div class="row justify-content-center px-2">
            <membershipNav :userIds="userIds" :userInfos="userInfos" :userCarts="userCarts"/>
            <main class="col-xl-10 col-lg-8 ms-auto justify-content-center mt-3">
                <section id="sectionPosts">
                    <div class="row justify-content-center">
                        <div class="col-xl-9 col-md-10 py-5 px-xl-4 bg-transparent border border-secondary mt-xl-5 mt-3 ms-xl-3 rounded-4" v-for="(post, index) in premadePosts" :key="index">
                            <div class="row px-xl-5 px-3 bg-transparent">
                                <div class="col-6 p-1" v-for="(image, imgIndex) in parseImages(post.post_images)" :key="imgIndex">
                                    <div class="ratio ratio-1x1">
                                        <img :src="`/storage/${image}`" alt="Premade Post Image" class="w-100 h-100 object-fit-cover" />
                                    </div>
                                </div>
                                <div class="text-start bg-transparent mt-3">
                                    <p class="fw-light text-secondary bg-transparent">
                                        {{ new Date(post.created_at).toLocaleDateString('en-US', {year:'numeric', month: 'short', day: 'numeric'}) }}
                                    </p>
                                    <p class="fw-light text-white bg-transparent" v-html="post.caption.replace(/(\r\n|\n|\r)/g, '<br>')" style="font-size: 15px;"></p>
                                    <div class="d-flex bg-transparent gap-3">
                                        <div v-if="!isPostLiked(post.premadelike)" class="bg-transparent">
                                            <button class="btn btn-outline-secondary px-4 rounded-5" @click="likePost(post.id)">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-heart-fill bg-transparent"></i>
                                                    {{ post.premadelike.length }}
                                                </span>
                                            </button>
                                        </div>
                                        <div v-else class="bg-transparent">
                                            <button class="btn btn-secondary px-4 rounded-5" @click="likePost(post.id)">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-heart-fill bg-transparent"></i>
                                                    {{ post.premadelike.length }}
                                                </span>
                                            </button>
                                        </div>
                                        <div class="bg-transparent">
                                            <button class="btn btn-outline-secondary px-4 rounded-5" @click="btnCommentlength">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-chat-left-fill bg-transparent"></i> {{ post.premadecomment.length }}
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                    <form action="" class="bg-transparent mt-3" @submit.prevent="addComment(post.id)" v-if="userIds">
                                        <div class="input-group bg-transparent min-w-100">
                                            <img :src="`/storage/${userProfileImage}`" alt="" class="rounded-5 mt-1" width="60" height="55">
                                            <textarea id="commentText" class="form-control mx-2 rounded-4 shadow-none bg-secondary border-dark text-white" placeholder="Write a comment..." v-model="comments[post.id]"></textarea>
                                            <button class="btn" type="submit">
                                                <i class="bi bi-send-fill fs-3 bg-transparent" style="color: #B38ED1;"></i>
                                            </button>
                                        </div>
                                    </form>
                                    <div v-if="userIds" class="bg-transparent" >
                                        <div class="text-start bg-transparent mt-4 ps-1"  v-for="(comment, index) in post.premadecomment" :key="index">
                                            <div class="d-flex bg-transparent mt-4" v-if="comment.parent_id === null">
                                                <div class="text-start bg-transparent">
                                                    <img :src="`/storage/${comment.user.file_profile}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                                </div>
                                                <div class="text-start bg-transparent ms-2 w-100">
                                                    <span class="fw-semibold text-white bg-transparent" style="font-size: 13px;">{{ comment.user.fullname }}</span>
                                                    <div class="btn-group dropend bg-transparent" v-if="comment.comment_user_id === userIds">
                                                        <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                            <i class="bi bi-three-dots bg-transparent ms-2 text-white" style="cursor:pointer"></i>
                                                        </div>
                                                        <ul class="dropdown-menu mt-3 bg-dark  rounded-4">
                                                            <li class="bg-transparent">
                                                                <inertiaLink :href="`/delcomment/${comment.id}`" class="dropdown-item text-white bg-transparent" > Delete</inertiaLink>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <br>
                                                    <span class="fw-light text-white bg-transparent" style="font-size: 14px;">{{ comment.comment_text }}</span>
                                                    <br>
                                                    <div class="d-flex bg-transparent">
                                                        <div v-if="!isreactComment(comment.commentreaction)" class="bg-transparent">
                                                            <button class="btn btn-outline-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(comment.id)">
                                                                <span class="bg-transparent">
                                                                    <i class="bi bi-heart-fill bg-transparent"></i> {{ comment.commentreaction.length }}
                                                                </span>
                                                            </button>
                                                        </div>
                                                        <div v-else class="bg-transparent">
                                                            <button class="btn btn-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(comment.id)">
                                                                <span class="bg-transparent">
                                                                    <i class="bi bi-heart-fill bg-transparent"></i> {{ comment.commentreaction.length }}
                                                                </span>
                                                            </button>
                                                        </div>
                                                        <button class="btn rounded-5" style="font-size: 12px;" @click="showReplyInput(comment.id)">
                                                            <span class="bg-transparent text-white">
                                                                <i class="bi bi-chat-left-fill bg-transparent"></i> Reply
                                                            </span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex bg-transparent mt-2 ms-5" v-for="(reply, replyIndex) in post.premadecomment.filter(c => comment.id === c.parent_id)" :key="replyIndex">
                                                <div class="text-start bg-transparent">
                                                    <img :src="`/storage/${reply.user.file_profile}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                                </div>
                                                <div class="text-start bg-transparent ms-2 w-100">
                                                    <span class="fw-semibold text-white bg-transparent" style="font-size: 13px;">{{ reply.user.fullname }}</span>
                                                    <div class="btn-group dropend bg-transparent"  v-if="reply.comment_user_id === userIds">
                                                        <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                            <i class="bi bi-three-dots bg-transparent ms-2 text-white" style="cursor:pointer"></i>
                                                        </div>
                                                        <ul class="dropdown-menu mt-3 bg-dark  rounded-4">
                                                            <li class="bg-transparent">
                                                                <inertiaLink :href="`/delcomment/${reply.id}`" class="dropdown-item text-white bg-transparent" > Delete</inertiaLink>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <br>
                                                    <span class="fw-light text-white bg-transparent" style="font-size: 14px;">{{ reply.comment_text }}</span>
                                                    <br>
                                                    <div class="d-flex bg-transparent mt-1">
                                                        <div v-if="!isreactComment(reply.commentreaction)" class="bg-transparent">
                                                            <button class="btn btn-outline-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(reply.id)">
                                                                <span class="bg-transparent">
                                                                    <i class="bi bi-heart-fill bg-transparent"></i> {{ reply.commentreaction.length }}
                                                                </span>
                                                            </button>
                                                        </div>
                                                        <div v-else class="bg-transparent">
                                                            <button class="btn btn-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(reply.id)">
                                                                <span class="bg-transparent">
                                                                    <i class="bi bi-heart-fill bg-transparent"></i> {{ reply.commentreaction.length }}
                                                                </span>
                                                            </button>
                                                        </div>
                                                        <button class="btn rounded-5" style="font-size: 12px;" @click="showReplyInput(reply.parent_id)">
                                                            <span class="bg-transparent text-white">
                                                                <i class="bi bi-chat-left-fill bg-transparent"></i> Reply
                                                            </span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="min-w-75 bg-transparent ms-lg-5">
                                                <form action="" class="bg-transparent mt-3" v-if="activeCommentId === comment.id" @submit.prevent="addReply(post.id)">
                                                    <div class="input-group bg-transparent w-100">
                                                        <img :src="`/storage/${userProfileImage}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                                        <textarea id="replyComments" class="form-control mx-2 rounded-4 shadow-none bg-secondary border-dark text-white" placeholder="Write a reply..." v-model="replyText"></textarea>
                                                        <button class="btn" type="submit">
                                                                <i class="bi bi-send-fill fs-3 bg-transparent" style="color: #B38ED1;"></i>
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="text-center mt-3">
                    <p class="fw-semibold text-secondary">That's everything for now. Check back soon!</p>
                </div>
            </main>
            <div class="position-fixed bottom-0 py-4 border-top z-2" v-if="!userIds">
                <div class="text-center">
                    <span class="fw-semibold text-white fs-5">Join now to unlock exclusive Artbyannz Shop content</span>
                    <button @click="btnJoin" class="btn shadow-none text-white ms-2 rounded-5 fs-6 fw-semibold" style="background-color: #B38ED1;">Join now</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import membershipNav from '../MembershipNavbar/MembershipNav.vue';
import { Link as inertiaLink } from "@inertiajs/vue3";
import { router } from "@inertiajs/vue3";
export default {
  name: 'cMembershipDashboard',
  components:{membershipNav,inertiaLink},
  props:{
    userIds:Number,
    userInfos:Object,
    premadePosts: Array,
    totalLikes: Array,
    getall_comments:Array,
    userCarts:Object
  },
  data() {
        return {
            userProfileImage: this.userInfos ? this.userInfos.file_profile : '',
            selectedPostId: '',
            comments: {},
            replyText: '',
            activeCommentId: null,
            selectedCommentId: ''
        };
    },
    methods: {
        parseImages(jsonString) {
            return JSON.parse(jsonString);
        },
        likePost(postId) {
            this.selectedPostId = postId;
            const data = {
                postId: this.selectedPostId,
            };

            if(this.userIds){
                router.post('/storeLikes', data);
            }else{
                this.$inertia.visit('/membership');
            }
        },
        btnCommentlength(){
            if(this.userIds === null){
                this.$inertia.visit('/membership');
            }
        },
        isPostLiked(likes) {
            return likes.some((like) => like.user_id === this.userIds);
        },
        addComment(postId) {
            this.selectedPostId = postId;
            if (this.comments[this.selectedPostId]) {
                const data = {
                    newComment: this.comments[this.selectedPostId],
                    postId: this.selectedPostId,
                };
                router.post('/storeComment', data);
                this.comments = {};
            }
        },
        showReplyInput(commentId) {
            this.activeCommentId = commentId;
            this.$nextTick(() => {
                const replyInput = document.getElementById('replyComments');
                if (replyInput) {
                    replyInput.focus();
                }
            });
        },
        addReply(postId) {
            this.selectedPostId = postId;
            const data = {
                comment_post_id: this.selectedPostId,
                comment_text: this.replyText,
                parent_id: this.activeCommentId,
            };
            if(this.replyText){
                router.post('/storeReply', data);
                this.activeCommentId = null;
                this.replyText = ''
            }
        },
        reactComment(commentID){
            this.selectedCommentId = commentID
            if(this.selectedCommentId){
                const data = {
                    reaction_comment_id: this.selectedCommentId
                }
                router.post('/storeReactcomment', data);
            }
            console.log(this.selectedCommentId);
        },
        isreactComment(react){
            return react.some((reacts) => reacts.reaction_user_id === this.userIds)
        },
        btnJoin(){
            this.$inertia.visit('/membership');
        }
    },
    mounted() {
        console.log(this.premadePosts);
    },
}
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section{
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}
</style>

