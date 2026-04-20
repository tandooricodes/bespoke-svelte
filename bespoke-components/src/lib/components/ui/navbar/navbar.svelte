<script>
	import { cn } from '../../../utils.js';
	import { ChevronRight } from 'lucide-svelte';

	/** @type {{
	 *   class?: string,
	 *   title?: string,
	 *   children?: import('svelte').Snippet,
	 *   [key: string]: any
	 * }} */
	let { class: className, title = '', children, ...restProps } = $props();
</script>

<nav
	data-slot="navbar"
	class={cn(
		'fixed top-0 right-0 left-0 z-50 flex h-12 items-center gap-2 border-b border-border bg-background px-3 text-foreground',
		className
	)}
	{...restProps}
>
	<button
		type="button"
		data-slot="navbar-sidebar-trigger"
		aria-label="Toggle sidebar"
		class="inline-flex size-8 items-center justify-center rounded-lg transition-colors hover:bg-muted"
	>
		<ChevronRight class="size-4" />
	</button>
	{#if title}
		<span class="text-sm font-medium">{title}</span>
	{/if}
	<div class="ml-auto flex items-center gap-2">
		{@render children?.()}
	</div>
</nav>
