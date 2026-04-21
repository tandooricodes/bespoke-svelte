<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { Navbar, PageContainer, Sidebar } from 'bespoke-components';
	import { House, ArrowDown } from 'lucide-svelte';

	let { children } = $props();

	let collapsed = $state(false);

	const sidebarItems = [
		{ label: 'Home', icon: House, path: '/' },
		{ label: 'Button', icon: ArrowDown, path: '/button' }
	];
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<Navbar title="Bespoke" />
<Sidebar {sidebarItems} bind:collapsed />
<PageContainer>
	{@render children()}
</PageContainer>
