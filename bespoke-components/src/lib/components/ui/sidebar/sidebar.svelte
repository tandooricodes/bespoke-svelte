<script>
	import { cn } from '../../../utils.js';
	import { page } from '$app/state';
	import { browser } from '$app/environment';
	import { Sun, Moon, MonitorSmartphone } from 'lucide-svelte';
	import DropdownMenu from '../dropdown-menu/dropdown-menu.svelte';
	import DropdownMenuTrigger from '../dropdown-menu/dropdown-menu-trigger.svelte';
	import DropdownMenuContent from '../dropdown-menu/dropdown-menu-content.svelte';
	import DropdownMenuItem from '../dropdown-menu/dropdown-menu-item.svelte';
	import DropdownMenuLabel from '../dropdown-menu/dropdown-menu-label.svelte';
	import DropdownMenuSeparator from '../dropdown-menu/dropdown-menu-separator.svelte';

	/** @type {{
	 *   sidebarItems: Array<{ label: string, icon: new (...args: any[]) => import('svelte').SvelteComponent, path: string }>,
	 *   collapsed?: boolean,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { sidebarItems, collapsed = $bindable(false), class: className, ...restProps } = $props();

	/** @type {'light' | 'dark' | 'system'} */
	let theme = $state(/** @type {'light' | 'dark' | 'system'} */ (browser ? (localStorage.getItem('theme') ?? 'system') : 'system'));

	/** @param {'light' | 'dark' | 'system'} t */
	function applyTheme(t) {
		if (!browser) return;
		const root = document.documentElement;
		if (t === 'dark') {
			root.classList.add('dark');
		} else if (t === 'light') {
			root.classList.remove('dark');
		} else {
			if (window.matchMedia('(prefers-color-scheme: dark)').matches) root.classList.add('dark');
			else root.classList.remove('dark');
		}
	}

	/** @param {'light' | 'dark' | 'system'} t */
	function setTheme(t) {
		theme = t;
		localStorage.setItem('theme', theme);
		applyTheme(theme);
	}

	$effect(() => {
		applyTheme(theme);
	});

	const themeConfig = {
		light: { icon: Sun, label: 'Light' },
		dark: { icon: Moon, label: 'Dark' },
		system: { icon: MonitorSmartphone, label: 'System' }
	};

	let themeLabel = $derived(themeConfig[theme].label + ' Theme');

	/** @param {string} path */
	function isActive(path) {
		if (path === '/') return page.url.pathname === '/';
		return page.url.pathname.startsWith(path);
	}
</script>

<aside
	data-slot="sidebar"
	class={cn(
		'absolute top-12 bottom-0 left-0 z-40 flex flex-col border-r border-border bg-background py-4 transition-all duration-150 ease-in-out',
		collapsed ? 'w-18 max-md:hidden' : 'w-56',
		className
	)}
	{...restProps}
>
	<nav class="flex flex-col gap-2 px-3.5">
		{#each sidebarItems as item}
			<div class="group/item relative">
				<a
					href={item.path}
					class={cn(
						'flex h-10 items-center gap-3 rounded-lg px-3 transition-colors',
						isActive(item.path)
							? 'bg-muted text-foreground'
							: 'text-muted-foreground hover:bg-muted hover:text-foreground'
					)}
				>
					<item.icon class="size-4 shrink-0" />
					<span
						class={cn(
							'truncate text-sm font-medium transition-all duration-150',
							collapsed ? 'w-0 overflow-hidden opacity-0' : 'opacity-100'
						)}
					>
						{item.label}
					</span>
				</a>
				{#if collapsed}
					<div
						class="pointer-events-none absolute top-1/2 left-full z-50 ml-3 -translate-y-1/2 rounded-md border border-border bg-popover px-2 py-1 text-xs whitespace-nowrap text-popover-foreground opacity-0 shadow-md transition-opacity group-hover/item:opacity-100"
					>
						{item.label}
					</div>
				{/if}
			</div>
		{/each}
	</nav>

	<div class="group/theme relative mt-auto p-3.5">
		<DropdownMenu>
			<DropdownMenuTrigger
				class="flex h-10 w-full items-center gap-3 rounded-lg px-3 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
			>
				{#if theme === 'dark'}
					<Moon class="size-4 shrink-0" />
				{:else if theme === 'light'}
					<Sun class="size-4 shrink-0" />
				{:else}
					<MonitorSmartphone class="size-4 shrink-0" />
				{/if}
				<span
					class={cn(
						'truncate text-sm font-medium transition-all duration-150',
						collapsed ? 'w-0 overflow-hidden opacity-0' : 'opacity-100'
					)}
				>
					{themeLabel}
				</span>
			</DropdownMenuTrigger>
			<DropdownMenuContent side="top" align="start" class="w-40">
				<DropdownMenuLabel>Theme</DropdownMenuLabel>
				<DropdownMenuSeparator />
				<DropdownMenuItem onclick={() => setTheme('light')}>
					<Sun class="size-4" />
					Light
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => setTheme('dark')}>
					<Moon class="size-4" />
					Dark
				</DropdownMenuItem>
				<DropdownMenuItem onclick={() => setTheme('system')}>
					<MonitorSmartphone class="size-4" />
					System
				</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
		{#if collapsed}
			<div
				class="pointer-events-none absolute top-1/2 left-full z-50 ml-3 -translate-y-1/2 rounded-md border border-border bg-popover px-2 py-1 text-xs whitespace-nowrap text-popover-foreground opacity-0 shadow-md transition-opacity group-hover/theme:pointer-events-auto group-hover/theme:opacity-100"
			>
				{themeLabel}
			</div>
		{/if}
	</div>
</aside>
