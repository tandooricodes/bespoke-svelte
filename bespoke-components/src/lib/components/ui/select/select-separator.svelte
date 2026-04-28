<script>
	import { cn } from '../../../utils.js';

	/** @type {{ class?: string, [key: string]: any }} */
	let { class: className, ...restProps } = $props();
</script>

<div role="separator" class={cn('-mx-1 my-1 h-px bg-border', className)} {...restProps}></div>
