<template>
    <AdminLayout>
        <div
            id="MorePage"
            class="flex"
            :class="userStore.isMobile ? 'pt-24' : 'pt-32'"
        >
            <div class="rounded-md bg-white w-full">
                <button
                    @click="($event) => logout()"
                    class="w-full flex items-center text-gray-600 p-3 hover:text-black"
                    :class="userStore.isMobile ? 'text-[20px]' : 'text-[15px]'"
                >
                    <Icon
                        name="circum:logout"
                        class="mr-6"
                        :size="userStore.isMobile ? '22' : '15'"
                    />
                    Sign out
                </button>
            </div>
        </div>
    </AdminLayout>
</template>

<script setup>
import AdminLayout from "~/layouts/AdminLayout.vue";
import { useUserStore } from "~/stores/user";

const userStore = useUserStore();
const router = useRouter();
let windowWidth = ref(process.client ? window.innerWidth : "");

onMounted(() => {
    window.addEventListener("resize", () => {
        windowWidth.value = window.innerWidth;
    });
});

const logout = async () => {
    let res = confirm("Are you sure you want to logout?");
};

watch(
    () => windowWidth.value,
    () => {
        if (windowWidth.value >= 767) {
            router.push("/admin");
        }
    }
);
</script>
