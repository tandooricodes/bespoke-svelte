<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { BespokeLayout } from 'bespoke-components';
	import { House, ArrowDown, ChevronDown, ListFilter, Search, Table2 } from 'lucide-svelte';

	let { children } = $props();

	const sidebarItems = [
		{ label: 'Home', icon: House, path: '/' },
		{ label: 'Button', icon: ArrowDown, path: '/button' },
		{ label: 'Dropdown Menu', icon: ChevronDown, path: '/dropdown-menu' },
		{ label: 'Select', icon: ListFilter, path: '/select' },
		{ label: 'Combobox', icon: Search, path: '/combobox' },
		{ label: 'Table', icon: Table2, path: '/table' }
	];
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<BespokeLayout title="Bespoke" {sidebarItems}>
	{@render children()}
</BespokeLayout>
