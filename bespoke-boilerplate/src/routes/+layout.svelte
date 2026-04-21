<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { BespokeLayout } from 'bespoke-components';
	import { House, ArrowDown } from 'lucide-svelte';

	let { children } = $props();

	const sidebarItems = [
		{ label: 'Home', icon: House, path: '/' },
		{ label: 'Button', icon: ArrowDown, path: '/button' }
	];
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<BespokeLayout title="Bespoke" {sidebarItems}>
	{@render children()}
</BespokeLayout>
