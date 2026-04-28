<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();
</script>

<thead class={cn('[&_tr]:border-b [&_tr]:border-border', className)} {...restProps}>
	{@render children?.()}
</thead>
