<script>
	import { cn } from '../../../utils.js';

	let { ref = $bindable(null), class: className = '', children, ...restProps } = $props();
</script>

<div
	bind:this={ref}
	data-slot="dialog-header"
	class={cn('flex flex-col gap-2', className)}
	{...restProps}
>
	{@render children?.()}
</div>
