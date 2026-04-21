<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { Navbar, PageContainer, Sidebar } from 'bespoke-components';
	import { House, ArrowDown } from 'lucide-svelte';

	let { children } = $props();

	let collapsed = $state(true);
  const toggleCollapsed = () => {
    console.log("sidebar toggle")
    collapsed = !collapsed
  }

	const sidebarItems = [
		{ label: 'Home', icon: House, path: '/' },
		{ label: 'Button', icon: ArrowDown, path: '/button' }
	];
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<Navbar title="Bespoke" toggleSidebarCollapse={toggleCollapsed} sidebarCollapsed={collapsed}/>
<Sidebar {sidebarItems} collapsed={collapsed}/>
<PageContainer>
	{@render children()}
</PageContainer>
