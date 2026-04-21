<script>
	import { cn } from '../../../utils.js';
	import { page } from '$app/state';

	/** @type {{
	 *   sidebarItems: Array<{ label: string, icon: new (...args: any[]) => import('svelte').SvelteComponent, path: string }>,
	 *   collapsed?: boolean,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { sidebarItems, collapsed = $bindable(false), class: className, ...restProps } = $props();

	/** @param {string} path */
	function isActive(path) {
		if (path === '/') return page.url.pathname === '/';
		return page.url.pathname.startsWith(path);
	}
</script>

<aside
	data-slot="sidebar"
	class={cn(
		'fixed top-12 left-0 z-40 flex h-[calc(100vh-3rem)] flex-col overflow-hidden border-r border-border bg-background py-2 transition-all duration-200 ease-in-out',
		collapsed ? 'w-14' : 'w-56',
		className
	)}
	{...restProps}
>
	<nav class="flex flex-col gap-0.5 px-1">
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
							'truncate text-sm font-medium transition-all duration-200',
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
</aside>
